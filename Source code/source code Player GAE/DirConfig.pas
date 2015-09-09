unit DirConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FileCtrl, ComCtrls, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DirectoryListBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SettingFile:Textfile;
    SettingFileName:string;
    procedure Configure;
  end;

var
  Form2: TForm2;

implementation
uses player;
{$R *.dfm}

{***********************Implementation Public Declaration****************}
procedure TForm2.Configure;
var
  s,sum:string;
  CopyRes:string;
begin
    SettingFileName:=extractfilepath(paramstr(0))+'settingplayer.txt';
    Assignfile(SettingFile,SettingFileName);
    reset(SettingFile);
    sum:='';
    while(not eof(SettingFile))do
    begin
      readln(Settingfile,s);
      sum:=sum+s;
    end;
    closefile(settingfile);
    if (sum='')then
    begin
      {*open file to write*}
      Assignfile(SettingFile,SettingFileName);
      rewrite(SettingFile);
      CopyRes:=copy(extractfilepath(paramstr(0)),0,length(extractfilepath(paramstr(0)))-1);
      writeln(settingfile,CopyRes);

      closefile(settingfile);
      {*open file to read*}
      Assignfile(SettingFile,SettingFileName);
      reset(SettingFile);
      readln(Settingfile,s);
      opendialog1.InitialDir:=s;
      {directorylistbox1.Directory:=lowercase(s);}
      edit1.text:=lowercase(s);
      {drivecombobox1.Drive:=directorylistbox1.Drive;}
      closefile(Settingfile);
    end;
    if (sum<>'')then
    begin
      {*open file to read*}
      Assignfile(SettingFile,SettingFileName);
      reset(SettingFile);
      readln(Settingfile,s);
      opendialog1.InitialDir:=s;
      {directorylistbox1.Directory:=lowercase(s);}
      edit1.text:=lowercase(s);
      {drivecombobox1.Drive:=directorylistbox1.Drive;}
      closefile(Settingfile);
    end;
   
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  configure;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
    pagecontrol1.ActivePageIndex:=0;
    configure;
end;

procedure TForm2.DirectoryListBox1Click(Sender: TObject);
begin
  // edit1.Text:=directorylistbox1.GetItemPath(directorylistbox1.ItemIndex);
  // drivecombobox1.Drive:=directorylistbox1.Drive;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  copyres:string;
begin
    if opendialog1.Execute then
    begin
      CopyRes:=copy(extractfilepath(opendialog1.FileName),0,length(extractfilepath(opendialog1.FileName))-1);
      edit1.Text:=copyres;
    end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    {*open file to write*}
   SettingFileName:=extractfilepath(paramstr(0))+'settingplayer.txt';
   Assignfile(SettingFile,SettingFileName);
   rewrite(SettingFile);
   writeln(settingfile,edit1.text);
   closefile(settingfile);
   form1.FileListBox1.Directory:=edit1.Text;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
   form2.Close;
end;

end.
