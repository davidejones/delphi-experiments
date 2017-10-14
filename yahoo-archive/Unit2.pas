unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, registry;

type
  TForm2 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    keytxtbox: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

Function YID:string;
const
yahoodir = '\Software\Yahoo\Pager\';
var
 yahooid:string;
begin
with TRegistry.Create do
   begin
     RootKey := HKEY_CURRENT_USER;
     if OpenKey(yahoodir,false) then
     begin
       yahooid:=readstring('Yahoo! User ID');
       CloseKey;
     end;
   end;
 Result:=yahooid;
end;

Procedure SetArchiving(enabled:integer);
Const
yahoodir = '\Software\Yahoo\Pager\';
var
 id:string;
begin
id:=YID;
with TRegistry.Create do
   begin
     RootKey := HKEY_CURRENT_USER;
     if OpenKey(yahoodir+'profiles\'+id+'\Archive\',false) then
     begin
       WriteInteger('Enabled',enabled);
       CloseKey;
     end;
   end;
End;

Function IsArchiveEnabled:string;
const
yahoodir = '\Software\Yahoo\Pager\';
var
 enabled:integer;
 id:string;
begin
enabled:=0;
id:=YID;
with TRegistry.Create do
   begin
     RootKey := HKEY_CURRENT_USER;
     if OpenKey(yahoodir+'profiles\'+id+'\Archive\',false) then
     begin
       enabled:=readinteger('Enabled');
       CloseKey;
     end;
   end;
   Result:=inttostr(enabled);
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
keytxtbox.Enabled:=false;
auto:=True;
end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
keytxtbox.Enabled:=true;
key:=keytxtbox.Text;
auto:=false;

end;

procedure TForm2.FormActivate(Sender: TObject);
begin
radiobutton2.Checked:=auto;

if IsArchiveEnabled = '1' then
  begin
  label2.Caption:='Enabled';
  end;

if IsArchiveEnabled = '0' then
  begin
  label2.Caption:='Disabled';
  end;

if IsArchiveEnabled = '0' then
begin
Checkbox1.checked:=false;
end;
if IsArchiveEnabled = '1' then
begin
Checkbox1.checked:=true;
end;

end;

procedure TForm2.Button1Click(Sender: TObject);
begin

if checkbox1.Checked=true then
 begin
  SetArchiving(1);
 end;
if checkbox1.Checked=false then
begin
  SetArchiving(0);
 end;
 
form2.Close;
end;

end.
