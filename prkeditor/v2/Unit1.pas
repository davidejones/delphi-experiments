unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, inifiles;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    GroupBox3: TGroupBox;
    OpenDialog1: TOpenDialog;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit4: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit5: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Edit6: TEdit;
    Label14: TLabel;
    Edit7: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Button4: TButton;
    Label17: TLabel;
    Label18: TLabel;
    LoadPark1: TMenuItem;
    Createabackup1: TMenuItem;
    About2: TMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Preferences1Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure LoadPark1Click(Sender: TObject);
    procedure Createabackup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure About2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fname:string;
  objID,xaxis,yaxis,height1,zeros:integer;
  aftername, ParkSizePos:integer;
implementation

uses Unit2, Unit3;

{$R *.dfm}

Procedure Clearinput(Edit:TEdit;Edit1:TEdit;Edit2:TEdit;Edit3:TEdit;Edit4:TEdit;Edit5:TEdit;Edit6:TEdit);
begin
Edit.Clear;
Edit1.Clear;
edit2.clear;
edit3.clear;
edit4.Clear;
edit5.Clear;
edit6.Clear;
end;

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

{Function findfirstobj(pos1:integer):integer;
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
end; }

Function GetobjID(offset:string):string;
Var
FS:TFileStream;
temp:integer;
begin
FS:=TFileStream.Create(fname, fmopenread or fmsharedenynone);
fs.Position:=strtoint(offset);
fs.Read(temp,1);
fs.Free;
Result:=IntToHex(temp,2);
end;

Function GetXAxis(offset:string):string;
Var
FS:TFileStream;
temp:integer;
hex:string;
begin
FS:=TFileStream.Create(fname, fmopenread or fmsharedenynone);
fs.Position:=strtoint(offset);
fs.Read(temp,1);
fs.Read(temp,1);
hex:=IntToHex(temp,2);
fs.Free;
Result:=hex;
end;

Function GetYAxis(offset:string):string;
Var
FS:TFileStream;
temp:integer;
hex:string;
begin
FS:=TFileStream.Create(fname, fmopenread or fmsharedenynone);
fs.Position:=strtoint(offset);
fs.Read(temp,1);
fs.Read(temp,1);
fs.Read(temp,1);
hex:=IntToHex(temp,2);
fs.Free;
Result:=hex;
end;

Function GetHeightDirection(offset:string):string;
Var
FS:TFileStream;
temp:integer;
hex:string;
begin
FS:=TFileStream.Create(fname, fmopenread or fmsharedenynone);
fs.Position:=strtoint(offset);
fs.Read(temp,1);
fs.Read(temp,1);
fs.Read(temp,1);
fs.Read(temp,1);
hex:=IntToHex(temp,2);
fs.Read(temp,1);
hex:=hex+IntToHex(temp,2);
fs.Free;
Result:= hex;
end;

Function GetParkSize(fname:string):string;
var
Stream:TFileStream;
pos, buffer1, buffer:integer;
Begin
pos:=0;
Stream:=TFileStream.Create(fname,fmopenread or fmsharedenynone);
repeat
Stream.Read(buffer,1);
if buffer = 82 then
begin
Stream.Read(buffer,1);
if buffer = 124 then
pos:=Stream.position;
break;
end;
until Stream.size=Stream.position;
Stream.Position:=pos+18;
Stream.read(buffer1,1);
Result:=IntToHex(buffer1,2);
Stream.Read(buffer1,1);
Result:=Result+IntToHex(buffer1,2);
Stream.free;

end;

Function GetParkSizePos(fname:string):integer;
Var
Str:TFileStream;
buffer,buffer1,temp,temp1,pos:integer;
Position:integer;
Begin
Str:=TFileStream.Create(fname,fmopenread or fmsharedenynone);
Str.Position:=0;
Repeat
str.ReadBuffer(temp,1);
str.ReadBuffer(temp1,1);
if (temp = 36) and (temp1 = 78) then break;
until str.Position=str.Size;
//Str.Position:=pos;
Str.Position:=Str.Position+6;
Position:=str.Position;
str.Free;
Result:=Position;
end;

Function GetParkSize1(fname:string):string;
var
Stream:TFileStream;
c:char;
pos,temp:integer;
buf:word;
hex:string;
Begin
pos:=0;
Stream:=TFileStream.Create(fname,fmopenread or fmsharedenynone);
pos:=-1;
repeat
Stream.Read(c,1);
if c = 'R' then
begin
Stream.Read(c,1);
if c='|' then
pos:=Stream.position;
break;
end;
until Stream.size=Stream.position;
if pos=-1 then
   exit;
Stream.Position:=pos+18;
//Stream.read(buf,2);
//Result:=IntToHex(buf,4);
Stream.read(temp,1);
Hex:=IntToHex(temp,2);
Stream.read(temp,1);
Hex:=Hex+IntToHex(temp,2);
Result:=Hex;
Stream.free;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
//Showmessage('Version 1.3 - A Program to modify THUG2 Parks');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
FS:TFilestream;
temp, temp1, temp2:integer;
pos,len,ipos,ppos:integer;
buffer,buffer1:integer;
hex:string;
begin
pos:=0;
clearinput(edit1,edit2,edit3,edit4,edit5,edit6,edit7);
listbox1.Clear;
label3.Caption:='';
label4.Caption:='';
label16.Caption:='';
if opendialog1.Execute then
begin
button2.Enabled:=true;
button3.Enabled:=true;
button4.Enabled:=true;
fname:=opendialog1.FileName;
label16.Caption:=GetParkSize1(fname);
label3.Caption:=fname;
label3.Hint:=label3.Caption;
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
label4.Caption:=readtext(fname,pos+32);
fs.free;

// This is for loading the park objects into listbox

len:=length(label4.Caption);
len:=len-12;
len:=3416-len;
len:=len+aftername;
FS:=TFileStream.Create(fname, fmopenreadwrite or fmsharedenynone);
fs.position:=len;

//for adding objects id in list
{repeat
 fs.read(temp,1);
 listbox1.Items.Add(IntToHex(temp,2)); for adding objects id in list
 //fs.read(temp1,7);
 fs.read(temp1,6);
 fs.read(temp2,1);
until temp2 <> 0; }

//for adding offset in list
repeat
 ipos:=fs.position;
 fs.read(temp,1);
 listbox1.Items.Add(inttostr(ipos));
 //fs.read(temp1,7);
 fs.read(temp1,6);
 fs.read(temp2,1);
until temp2 <> 0;

fs.free;

//GET THE PARK SIZE INTO LABEL
{FS:=TFileStream.Create(fname, fmopenreadwrite or fmsharedenynone);
repeat
fs.Read(buffer,1);
if buffer = 82 then
begin
fs.Read(buffer,1);
if buffer = 124 then
pos:=fs.position;
break;
end;
until fs.size=fs.position;
fs.Position:=pos+18;
fs.read(buffer1,1);
hex:=IntToHex(buffer1,2);
fs.Read(buffer1,1);
hex:=hex+IntToHex(buffer1,2);
fs.free;
label16.Caption:=Hex;}
//END OF GET THE PARK SIZE
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
FS:TFileStream;
temp:integer;
begin
//showmessage('not done yet');
//set variables
objID:=strtoint('$'+edit1.text);
xaxis:=strtoint('$'+edit2.text);
yaxis:=strtoint('$'+edit5.text);
height1:=strtoint('$'+edit3.text);

FS:=TFileStream.create(fname, fmopenreadwrite or fmsharedenynone);
fs.Position:=strtoint(label11.caption);
fs.Write(objID,1);
fs.Write(xaxis,1);
fs.Write(yaxis,1);
fs.Write(temp,1);
fs.Write(height1,1);
//fs.write(zeros,3);
fs.free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
//showmessage('not done yet');
form2.showmodal;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
edit4.Text:=inttostr(listbox1.ItemIndex);
label11.Caption:=listbox1.Items[listbox1.ItemIndex];
edit1.Text:=GetobjID(listbox1.Items[listbox1.ItemIndex]);
edit2.Text:=GetXAxis(listbox1.Items[listbox1.ItemIndex]);
edit5.text:=GetYAxis(listbox1.Items[listbox1.ItemIndex]);
edit3.text:=GetHeightDirection(listbox1.Items[listbox1.ItemIndex]);
end;

procedure TForm1.Preferences1Click(Sender: TObject);
begin
//showmessage('There are none Fool!');
form3.showmodal;
end;

procedure TForm1.Edit6KeyPress(Sender: TObject; var Key: Char);
begin

if key in ['G'..'Z'] then
begin
key:=#13;
end;

if key in ['g'..'z'] then
begin
key:=#13;
end;


end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['G'..'Z'] then
begin
key:=#13;
end;

if key in ['g'..'z'] then
begin
key:=#13;
end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['G'..'Z'] then
begin
key:=#13;
end;

if key in ['g'..'z'] then
begin
key:=#13;
end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['G'..'Z'] then
begin
key:=#13;
end;

if key in ['g'..'z'] then
begin
key:=#13;
end;
end;

procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['G'..'Z'] then
begin
key:=#13;
end;

if key in ['g'..'z'] then
begin
key:=#13;
end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['G'..'Z'] then
begin
key:=#13;
end;

if key in ['g'..'z'] then
begin
key:=#13;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
FS:TFileStream;
pwidth,plength,pos,temp:integer;
btnpressed,buffer,buffer1:integer;
hex:string;
begin
if edit6.Text = '' then
begin
Showmessage('You must enter a Width');
end;
If edit7.Text = '' then
begin
Showmessage('You must enter a Length');
end;
If (edit6.Text <> '') and (edit7.Text <> '') then
begin
pwidth:=strtoint('$'+edit6.text);
plength:=strtoint('$'+edit7.text);
pos:=0;
FS:=TFileStream.create(fname, fmopenreadwrite or fmsharedenynone);
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
fs.Position:=pos+18;
fs.Write(pwidth,1);
fs.Write(plength,1);
fs.free;
edit6.Clear;
edit7.Clear;
end;
btnpressed:=MessageDlg('New Park Size Set!',mtinformation,[mbok], 0);
if btnpressed = mrok then
begin
FS:=TFileStream.Create(fname, fmopenreadwrite or fmsharedenynone);
repeat
fs.Read(buffer,1);
if buffer = 82 then
begin
fs.Read(buffer,1);
if buffer = 124 then
pos:=fs.position;
break;
end;
until fs.size=fs.position;
fs.Position:=pos+18;
fs.read(buffer1,1);
hex:=IntToHex(buffer1,2);
fs.Read(buffer1,1);
hex:=hex+IntToHex(buffer1,2);
fs.free;
label16.Caption:=Hex;
end;

end;
procedure TForm1.LoadPark1Click(Sender: TObject);
begin
button1.Click;
end;

procedure TForm1.Createabackup1Click(Sender: TObject);
var
F3:TMemoryStream;
FS1:TFileStream;
begin
if label3.caption <> '' then
begin
F3:=TMemoryStream.Create;
FS1:=TFileStream.Create(fname, fmopenread or fmsharedenynone);
f3.CopyFrom(FS1, 0);
F3.SaveToFile(fname+'_BACKUP');
FS1.free;
F3.Free;
MessageDlg('Backup Created',mtInformation,[mbok], 0);
end else
begin
MessageDlg('You need to load a park before you can back it up',mtInformation,[mbok], 0);
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
    myINI : TINIFile;
begin
{if not fileexists(ExtractFilePath(Application.EXEName) + 'Objects.ini') then
begin
    myINI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'Objects.ini');
    myINI.WriteString('ObjectIDs', '1E', 'Bench');

    //combobox1.Items.Add(myINI.ReadString('ObjectIDs', '1E', 'Default'));
    myINI.Free;
end;}
end;

procedure TForm1.About2Click(Sender: TObject);
begin
form3.ShowModal;
end;

end.
