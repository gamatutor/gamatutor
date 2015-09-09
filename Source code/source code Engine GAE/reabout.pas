unit reabout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, OleCtnrs, Buttons;

type
  TAboutBox = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    PhysMem: TLabel;
    Label4: TLabel;
    FreeRes: TLabel;
    OKButton: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses ShellAPI;

{$R *.dfm}

procedure TAboutBox.FormCreate(Sender: TObject);
var
  MS: TMemoryStatus;
begin
  GlobalMemoryStatus(MS);
  PhysMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);

end;

procedure TAboutBox.SpeedButton1Click(Sender: TObject);
begin
  ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'howto\BakpiaEngineHelp.exe'), nil, nil, SW_SHOWNORMAL);
  //ShellExecute(Self.Handle,nil,pchar(extractfilepath(paramstr(0))+'script\BakpiaEngineHelp.exe'), nil, nil, SW_SHOWNORMAL);
end;

end.
