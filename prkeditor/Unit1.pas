unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Button2: TButton;
    Edit5: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fname:string;
  objID,xaxis,yaxis,height1,zeros:integer;
  aftername:integer;
implementation

{$R *.dfm}

function readtext(fname:string;pos:integer):string;
var
temp:integer;
fs:TFileStream;
text:string;
begin
 FS:=TFileStream.Create(fname,fmOpenRead or fmShareDenyNone);
 fs.Position:=pos;
 Repeat
  fs.Read(temp, 1);
    if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if temp <> 0 then text:= text + Chr(temp);
  Until temp = 0;
  aftername:=fs.position-1;
  fs.free;
  result:=text;
end;

Function findfirstobj(pos1:integer):integer;
var
FS:TFileStream;
temp,pos:integer;
begin
fs.position:=pos1;
 Repeat
  fs.Read(temp, 1);
    if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if temp <> 0 then pos:=fs.position;
  Until temp <> 0;
  Result:=pos;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
FS:TFilestream;
temp:integer;
pos:integer;
begin
if opendialog1.Execute then
begin
fname:=opendialog1.FileName;
FS:=TFileStream.Create(opendialog1.FileName,fmOpenRead or fmShareDenyNone);

repeat
fs.Read(temp,1);
if temp = 82 then
begin
fs.Read(temp,1);
if temp = 124 then
pos:=fs.position;
break;
end;
until fs.size=fs.position;
fs.Position:=pos;

label7.Caption:=readtext(fname,pos+32);
fs.free;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
FS:TFileStream;
temp,zeros:integer;
begin
//set variables
objID:=strtoint(edit1.text);
xaxis:=strtoint(edit2.text);
//yaxis:=strtoint(edit3.text);
height1:=strtoint(edit4.text);
zeros:=$000000;

FS:=TFileStream.Create(fname,fmOpenReadWrite or fmShareDenyNone);
//fs.Position:=3545; //3,545 bytes
fs.Position:=strtoint(edit5.Text);
fs.Write(objID,1);
fs.Write(xaxis,2);
//fs.Write(yaxis,1);
fs.Write(temp,1);
fs.Write(height1,1);
fs.write(zeros,3);
fs.free;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
FS:TFileStream;
temp, len:integer;
begin

//set variables
objID:=strtoint(edit1.text);
xaxis:=strtoint(edit2.text);
//yaxis:=strtoint(edit3.text);
height1:=strtoint(edit4.text);
zeros:=$000000;

len:=length(label7.Caption);
len:=len-12;
len:=3416-len;
len:=len+aftername;

FS:=TFileStream.create(fname, fmopenreadwrite or fmsharedenynone);
//fs.position:=findfirstobj(len);
fs.Position:=len;
fs.Write(objID,1);
fs.Write(xaxis,2);
//fs.Write(yaxis,1);
fs.Write(temp,1);
fs.Write(height1,1);
fs.write(zeros,3);
fs.free;

end;

procedure TForm1.Button4Click(Sender: TObject);
var
len:integer;
begin
len:=length(label7.Caption);
showmessage(inttostr(len));
end;

end.
