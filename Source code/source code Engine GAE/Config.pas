unit Config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Buttons, ComCtrls, ExtCtrls, jpeg;

type
  TForm3 = class(TForm)
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SettingFile:Textfile;
    SettingFileName:string;
    procedure Configure;
  end;
var
  Form3: TForm3;
implementation

{$R *.dfm}
{***********************Implementation Public Declaration****************}

procedure TForm3.Configure;
var
  s,sum:string;
begin
    SettingFileName:=extractfilepath(paramstr(0))+'SettingEditor.txt';
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
      form3.Show;
      {*open file to write*}
     { Assignfile(SettingFile,SettingFileName);
      rewrite(SettingFile);
      writeln(settingfile,extractfilepath(paramstr(0))+'PlayerAnimasi.exe');
      closefile(settingfile);
      {*open file to read*}
     { Assignfile(SettingFile,SettingFileName);
      reset(SettingFile);
      readln(Settingfile,s);
      readln(Settingfile,s);
      edit2.Text:=lowercase(s);
      closefile(Settingfile); }
    end;
    if (sum<>'')then
    begin
      {*open file to read*}
      Assignfile(SettingFile,SettingFileName);
      reset(SettingFile);

      readln(Settingfile,s);
      edit2.Text:=lowercase(s);
      readln(settingfile,s);

      closefile(Settingfile);
    end;

end;
procedure TForm3.FormCreate(Sender: TObject);

begin
    configure;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
    opendialog1.InitialDir:=extractfilepath(paramstr(0));
    configure;
end;


procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SettingFileName:=extractfilepath(paramstr(0))+'SettingEditor.txt';
   Assignfile(SettingFile,SettingFileName);
   rewrite(SettingFile);
   writeln(settingfile,edit2.text);
   closefile(settingfile);
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
   if (opendialog1.Execute) then
   begin
     edit2.Text:=opendialog1.FileName;
   end;
end;

end.
