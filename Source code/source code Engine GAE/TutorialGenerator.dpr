program TutorialGenerator;

uses
  SysUtils,
  Forms,
  Desainer in 'Desainer.pas' {MainForm},
  Preview in 'Preview.pas' {Form2},
  Primitif in 'Primitif.pas',
  reabout in 'reabout.pas' {AboutBox},
  PointerMouse in 'PointerMouse.pas' {Form1},
  DelUpdatePointer in 'DelUpdatePointer.pas' {Form4},
  ConverttoFlash in 'ConverttoFlash.pas' {Flash},
  xtea in 'xtea.pas',
  Splash in 'Splash.pas' {SplashScreen};

{$R *.res}

begin
  SplashScreen := TSplashScreen.Create(Application) ;
  {SplashScreen.Show;  }

  Application.Initialize;
  SplashScreen.Update;
  {sleep(3000); }
  Application.HelpFile := '';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFlash, Flash);
  Application.CreateForm(TSplashScreen, SplashScreen);
  SplashScreen.Hide;
  SplashScreen.Free; 
  Application.Run;
end.
