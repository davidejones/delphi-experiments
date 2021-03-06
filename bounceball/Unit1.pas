unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, OleCtrls, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    box: TShape;
    Button1: TButton;
    ball: TShape;
    Timer1: TTimer;
    Button2: TButton;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
begin
timer1.Interval:=10;
timer1.Enabled:=true;
button1.Enabled:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
ball.Left:=ball.Left-2;
ball.Top:=ball.Top-2;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
timer1.Interval:=0;
timer3.Interval:=0;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
if ball.Left <= box.Left then
begin
if timer1.Interval <> 0 then
begin
timer1.Interval:=0;
timer3.Interval:=10;
ball.Brush.Color:=rgb(random(255),random(255),random(255));
end else begin
timer3.Interval:=0;
timer1.Interval:=10;
ball.Brush.Color:=rgb(random(255),random(255),random(255));
end;
end;

if ball.Top >= box.height+box.top-15 then
begin
if timer1.Interval <> 0 then
begin
timer1.Interval:=0;
timer3.Interval:=10;
ball.Brush.Color:=rgb(random(255),random(255),random(255));
end else begin
timer3.Interval:=0;
timer1.Interval:=10;
ball.Brush.Color:=rgb(random(255),random(255),random(255));
end;
end;

if ball.Left >= box.Width+box.Left-15 then
begin
if timer1.Interval <> 0 then
begin
timer1.Interval:=0;
timer3.Interval:=10;
ball.Brush.Color:=rgb(random(255),random(255),random(255));
end else begin
timer3.Interval:=0;
timer1.Interval:=10;
ball.Brush.Color:=rgb(random(255),random(255),random(255));
end;
end;

if ball.Top <= box.Top then
begin
if timer1.Interval <> 0 then
begin
timer1.Interval:=0;
timer3.Interval:=10;
end else begin
timer3.Interval:=0;
timer1.Interval:=10;
end;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
form1.DoubleBuffered:=true;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
ball.Left:=ball.Left+2;
ball.Top:=ball.Top+2;
end;

end.
