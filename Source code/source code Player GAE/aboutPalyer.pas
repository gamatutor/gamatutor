unit aboutPalyer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    PhysMem: TLabel;
    Label4: TLabel;
    FreeRes: TLabel;
    OKButton: TButton;
    Image1: TImage;
    Label2: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses ShellAPI;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
var
  MS: TMemoryStatus;
begin
  GlobalMemoryStatus(MS);
  PhysMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
  ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'howto\BakpiaPlayerHelp.exe'), nil, nil, SW_SHOWNORMAL);
end;



end.
