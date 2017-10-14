program Project1;

uses
  sysutils,Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {splashscreen};

{$R *.res}

begin
  Splashscreen := TSplashscreen.Create(Application);
  Splashscreen.Show;
  Application.Initialize;
  Splashscreen.Update;
  Sleep(250);  //Wait 2 seconds.
  Splashscreen.Gauge1.Progress:=15;
  sleep(250);
  Splashscreen.Gauge1.Progress:=30;
  sleep(250);
  Splashscreen.Gauge1.Progress:=50;
  sleep(500);
  Splashscreen.Gauge1.Progress:=84;
  sleep(250);
  Splashscreen.Gauge1.Progress:=100;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Splashscreen.Hide;
  Splashscreen.Free;
  Application.Run;
end.
