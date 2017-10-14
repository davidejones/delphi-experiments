unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ColorGrd;

type
  TForm1 = class(TForm)
    ColorDialog1: TColorDialog;
    Button1: TButton;
    Shape1: TShape;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TColorToHex(Color : TColor) : string;
begin
   Result :=
     IntToHex(GetRValue(Color), 2) +
     IntToHex(GetGValue(Color), 2) +
     IntToHex(GetBValue(Color), 2) ;
end;

function HexToTColor(sColor : string) : TColor;
begin
   Result :=
     RGB(
       StrToInt('$'+Copy(sColor, 1, 2)),
       StrToInt('$'+Copy(sColor, 3, 2)),
       StrToInt('$'+Copy(sColor, 5, 2))
     ) ;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if colordialog1.Execute then
begin
//showmessage(TColorToHex(colordialog1.color));
shape1.Brush.Color:=colordialog1.color;
edit1.Text:= TColorToHex(colordialog1.color);

end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key <> '' then
key:=#13;

end;

end.
