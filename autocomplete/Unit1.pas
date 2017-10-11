unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
ComboBox1.Items := Screen.fonts;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
I, StartPos: Integer;
begin
for I := 0 to ComboBox1.Items.Count -1 do
begin
with ComboBox1 do
begin
if (Text = '') or (LowerCase(Items[I]) = LowerCase(Text)) then Exit;
if StrLComp(PChar(LowerCase(Items[I])),PChar(LowerCase(Text)),Length(Text)) = 0 then begin
StartPos := Length(Text);
Text := Text + Copy(Items[I], StartPos + 1, Length(Items[I]));
SelStart := StartPos;
SelLength := Length(Text) - StartPos;
Exit; //Only if you want delay
//Timer1.Enabled := False; //Only if you want delay
end;
end;
end;
//Timer1.Enabled := False; //Only if you want delay
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);

var
I: Integer;
begin
if Key = #13 then begin
for I := 0 to ComboBox1.Items.Count -1 do begin
with ComboBox1 do if (LowerCase(Items[I]) = LowerCase(Text)) then Text := Items[I];
end;
end;
end;


end.
