program PlayerAnimasiNetwork;

uses
  Forms,
  player in 'player.pas' {Form1},
  PrimitifPlayer in 'PrimitifPlayer.pas',
  DirConfig in 'DirConfig.pas' {Form2},
  speedconfig in 'speedconfig.pas' {Form3},
  aboutPalyer in 'aboutPalyer.pas' {Form4},
  zooming in 'zooming.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
