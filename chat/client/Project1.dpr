program Project1;

uses
 {$IFDEF WIn32}
  Forms,
 {$ENDIF}

 {$IFDEF Linux}
  QForms,
 {$ENDIF}
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {AboutBox},
  Unit4 in 'Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
