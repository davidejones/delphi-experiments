unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,inifiles;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox1: TComboBox;
    Button2: TButton;
    Label5: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  newfname:string;
implementation

uses Unit1;

{$R *.dfm}

Function ObjCode (text:string):string;
begin
result:=text[1]+text[2];
end;

Procedure AddParkObj(fname:string;objid:TComboBox;xaxis:TEdit;yaxis:TEdit;hd:TEdit);
Var
FS:TFileStream;
temp,objid1,xaxis1,yaxis1,hd1:integer;
begin
//objid1:=strtoint('$'+objid.text);
objid1:=strtoint('$'+ ObjCode(objid.Text));
xaxis1:=strtoint('$'+xaxis.text);
yaxis1:=strtoint('$'+yaxis.text);
hd1:=strtoint('$'+hd.text);
FS:=TFileStream.Create(fname, fmopenreadwrite or fmsharedenynone);
fs.Position:=strtoint(form1.listbox1.Items[0]);
fs.Write(objid1,1);
fs.Write(xaxis1,1);
fs.Write(yaxis1,1);
fs.Write(temp,1);
fs.Write(hd1,1);
fs.Free;
end;

Procedure Backup(fname:string;objid:TComboBox;xaxis:TEdit;yaxis:TEdit;hd:TEdit);
var
buffer:integer;
F2,F3:TMemoryStream;
FS,FS1, FS2,F1:TFileStream;
size:integer;
temp,objid1,xaxis1,yaxis1,hd1:integer;
begin
//objid1:=strtoint('$'+objid.text);
objid1:=strtoint('$'+ ObjCode(objid.Text));
xaxis1:=strtoint('$'+xaxis.text);
yaxis1:=strtoint('$'+yaxis.text);
hd1:=strtoint('$'+hd.text);

{F3:=TMemoryStream.Create;
FS1:=TFileStream.Create(fname, fmopenread or fmsharedenynone);
FS1.Position:=strtoint(form1.listbox1.Items[0]);
f3.CopyFrom(FS1, fS1.Size);
FS1.Free;
F3.SaveToStream(FS);}

End;

procedure TForm2.Button2Click(Sender: TObject);
begin
if combobox1.Text ='' then
 begin
 Showmessage('You must input a object ID');
 end;
if edit1.Text ='' then
 begin
 Showmessage('You must input a X Axis');
 end;
if edit2.Text ='' then
 begin
 Showmessage('You must input a Y Axis');
 end;
if edit3.Text ='' then
 begin
 Showmessage('You must input the height/direction');
 end else
 begin
  AddParkObj(fname,combobox1,Edit1,Edit2,Edit3);
 end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
Backup(fname,combobox1,Edit1,Edit2,Edit3);
end;

procedure TForm2.FormCreate(Sender: TObject);
Var
myINI : TINIFile;
begin
myINI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'Objects.ini');
  try
    myINI.ReadSectionValues('ObjectIDs', comboBox1.Items);
  finally 
    myINI.Free;
  end;
end;

end.
