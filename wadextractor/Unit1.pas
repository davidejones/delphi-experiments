unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Button3: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Settings1: TMenuItem;
    Configuration1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Configuration1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  foffset:integer;
  nfsize:integer;

implementation

uses Unit2;

{$R *.dfm}

//void extract(long offset, long fsize, char* fname, char* wadfname)
Procedure extractfile(offset:integer;fsize:integer; fname:PChar; wadfname:PChar) cdecl; external 'waddll.dll';
Procedure createfilelists(fname:PChar;offset:PChar; filesize:PChar; fnames:PChar) cdecl; external 'waddll.dll';

Function extractname (s:string):PChar;
var
i:integer;
x:string;
begin
x:='';

if s <> '' then
begin
   for i:=0 to length(s) do
   begin
      x:=x + s[i];
      if ord(s[i]) = 92 then x:='';
   end;
end;
   result:=PChar(x);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
newfile,wadfile:PChar;
hedfile :string;
begin
//showmessage(opendialog1.filename);
//newfile := 'new.dat';
//wadfile := 'SKATE4.WAD';

newfile := PChar(ExtractFileName(listbox1.Items[listbox1.ItemIndex]));
hedfile := PChar(ExtractFileName(opendialog1.filename));
hedfile := ChangeFileExt(hedfile,'.WAD');
wadfile := PChar(hedfile);

//extractfile(0,53298,newfile,wadfile);
form2.Gauge1.Progress:=0;
form2.show;
if (nfsize = 0) then
begin
showmessage('ERROR: You selected a file with no filesize');
form2.close;
form2.Gauge1.Progress:=0;
end else
if (foffset < 0) then
begin
showmessage('ERROR: You selected a file with an incorrect offset');
form2.close;
form2.Gauge1.Progress:=0;
end else
begin
extractfile(foffset,nfsize,newfile,wadfile);
form2.Gauge1.Progress:=100;
form2.close;
Showmessage(newfile + ' Extracted sucessfully!');
form2.Gauge1.Progress:=0;
end;


end;

procedure TForm1.Button2Click(Sender: TObject);
var
FS:TFileStream;
temp,temp1:integer;
filesize,fsize,fsize1:integer;
buffer,buffer1,pos,i:integer;
lname:string;
Begin
if opendialog1.execute then
begin
// LOAD ALL THE FILENAMES INTO THE LISTBOX
FS:=TFileStream.create(opendialog1.filename, fmopenread or fmsharedenynone);
Repeat
 fs.Read(temp,1);
 if temp=fs.Size then break; //jump out of loop if eof
 if temp=92 then
 begin
  repeat
   fs.Read(buffer,1);
    //if buffer=92 then buffer:=95;
      if buffer <> 0 then lname:= lname + Chr(buffer);
  until buffer = 0;
  if length(lname)<=3 then
  begin
  lname:='';
  end else begin
  listbox1.Items.Add(lname);
  lname:='';
  end;
 end;
Until fs.Position=fs.Size;
fs.free;  
end;
//END LOADING LISTBOX FILES
end;


procedure TForm1.Button3Click(Sender: TObject);
var
FS:TFileStream;
offset,fisize:integer;
temp,buffer:integer;
zeros,addzeros,fpos,i:integer;
lname:string;
begin
if opendialog1.execute then
begin
form2.show;
form2.Gauge1.MaxValue:=100;
button1.Enabled:=true;
button4.Enabled:=true;

{
  // LOAD ALL THE FILENAMES INTO THE LISTBOX
  FS:=TFileStream.create(opendialog1.filename, fmopenread or fmsharedenynone);
  i:=0;
  fpos:=0;
  repeat
  fs.position:=fpos;
  fs.read(offset,4);
  fs.read(fisize,4);
  listbox2.Items.Add(inttostr(offset));
  //fs.Position:=fs.Position+8;
  repeat
   i:=i+1;
   fs.Read(buffer,1);
    //if buffer=92 then buffer:=95;
      if buffer <> 0 then lname:= lname + Chr(buffer);
      if buffer = 0 then break;
      if fs.Position >= fs.size then break;
  until buffer = 0;

  i:=i-1;
  fs.position:=fs.position-1;
  listbox1.Items.Add(lname);
  zeros := i mod 4;
  addzeros := 4 - zeros;
  fs.Position:=fs.Position+addzeros;


  //clear variables
  zeros:=0;
  addzeros:=0;
  lname:='';
  i:=0;

  fpos:=fs.Position;
  listbox3.Items.Add(inttostr(fisize));
  form2.Gauge1.AddProgress(1);
  until fs.position >= fs.size;

  fs.free;
  form2.close;
  }
  form2.Gauge1.AddProgress(5);
  createfilelists(PChar(opendialog1.filename), 'offset.txt', 'fsizefile.txt', 'fnamefile.txt');
  form2.Gauge1.AddProgress(35);
  listbox1.Items.LoadFromFile('fnamefile.txt');
  form2.Gauge1.AddProgress(50);
  listbox3.Items.LoadFromFile('fsizefile.txt');
  form2.Gauge1.AddProgress(80);
  listbox2.Items.LoadFromFile('offset.txt');
  form2.Gauge1.AddProgress(100);
  form2.close;
end;

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
listbox1.Items[listbox1.ItemIndex];
foffset:=strtoint(listbox2.Items[listbox1.ItemIndex]);
nfsize:=strtoint(listbox3.Items[listbox1.ItemIndex]);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Configuration1Click(Sender: TObject);
begin
showmessage('Coming soon....');
end;

procedure TForm1.About1Click(Sender: TObject);
begin
Showmessage('Wad Extractor V1.2' +chr(13)+'Created By David Jones (Invisible Man)'+chr(13)+'A tool to extract one file at a time from a thps wad.');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
i:integer;
temp : TStringList;
begin
temp:=TStringList.Create;
//temp.AddStrings(listbox1.Items);

for i := 0 to listbox1.Count-1 do
begin
    //temp.add(extractname(listbox1.Items[i]));
    temp.add(ExtractFileName(listbox1.Items[i]));
end;

listbox1.Clear;

for i := 0 to temp.Count-1 do
    listbox1.Items.Add(temp[i]);

end;

end.
