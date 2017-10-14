unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Gauges;

type
  Tsplashscreen = class(TForm)
    Image1: TImage;
    Gauge1: TGauge;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splashscreen: Tsplashscreen;

implementation

{$R *.dfm}

procedure Tsplashscreen.Timer1Timer(Sender: TObject);
begin
gauge1.Progress:=gauge1.Progress+1;

end;

end.
