program KakasAnimasiManual;

uses
  Forms,
  Desainer in 'Desainer.pas' {MainForm},
  Preview in 'Preview.pas' {Form2},
  Primitif in 'Primitif.pas',
  reabout in 'reabout.pas' {AboutBox},
  PointerMouse in 'PointerMouse.pas' {Form1},
  Config in 'Config.pas' {Form3},
  DelUpdatePointer in 'DelUpdatePointer.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
