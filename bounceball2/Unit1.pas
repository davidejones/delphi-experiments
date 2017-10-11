unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ball: TShape;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  horzpos,vertpos,minleft,maxleft,mintop,maxtop:integer;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
//form1.DoubleBuffered:=true;
panel1.DoubleBuffered:=true;

horzPos:=-1;
vertPos:=-1;
minLeft:=0;
//maxLeft:=Form1.ClientWidth-Form1.Width div 30;
maxleft:=panel1.Width + panel1.Left div 30;
minTop:=0;
//maxTop:=Form1.ClientHeight-Form1.Height div 30;
maxtop:=panel1.Height + panel1.Top -56;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   {if ball.Left >= panel1.Left then
   Ball.Left:=Ball.Left+-1;

   if Ball.Top>= panel1.Top then
       Ball.Top:=Ball.Top+ -1;}

    if Ball.Left>=minLeft then
       Ball.Left:=Ball.Left+horzPos;


    if Ball.Top>=minTop then
       Ball.Top:=Ball.Top+vertPos;


    if Ball.Left+Ball.Width>=maxLeft then
       horzPos:=-horzPos;


    if Ball.Top-Ball.Height>=maxTop then
       vertPos:= -vertPos;


    if Ball.Left<=minLeft then
       horzPos:=-horzPos;

    if Ball.Top<=minTop then
       vertPos:= -vertPos;





end;

end.
