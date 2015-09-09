unit ScreenRecord;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, jpeg, ExtCtrls,desainer,primitif,clipbrd;

type
  TForm5 = class(TForm)
    Image2: TImage;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;



var
  Form5: TForm5;
  ClassImage:image;
  emptyimage2,emptyimage1:boolean;  

  {----------------keyboard and mouse processing declaration-------------------------}

KBHook: HHook; {this intercepts keyboard input}
  {cx, cy : integer; {track battle ship's position}

  {callback's declaration}

  { function KeyboardHookProc(Code: Integer; WordParam: Word; LongParam: LongInt): LongInt; stdcall; }

implementation

{$R *.dfm}




procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
    { showmessage(floattostr(strtofloat(numframe.Text) / strtofloat(numsecond.Text)));   }
    mainform.WindowState:=wsminimized;

    {mainform.WindowState:=wsminimized; }

    form5.Hide;

end;

procedure TForm5.FormCreate(Sender: TObject);
begin
    {------------------hook the keyboard-------------------- }

   { KBHook:=SetWindowsHookEx(WH_KEYBOARD,
           {callback —> @KeyboardHookProc,
                          HInstance,
                          GetCurrentThreadId()) ; }
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
{--------------------unhook keyboard-----------------}

 {unhook the keyboard interception}
 { UnHookWindowsHookEx(KBHook) ;
{----------------------------------------------------}
end;

end.
