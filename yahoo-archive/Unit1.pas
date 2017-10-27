unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, jpeg, ExtCtrls, registry, XPMan, FileCtrl,
  ComCtrls, ShellCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exi1: TMenuItem;
    Options1: TMenuItem;
    Settings1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    smiley: TImage;
    Image1: TImage;
    XPManifest1: TXPManifest;
    FileListBox1: TFileListBox;
    ShellComboBox1: TShellComboBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    PopupMenu1: TPopupMenu;
    Load1: TMenuItem;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Exi1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure smileyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShellComboBox1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  key,fname1:string;
  auto:boolean;
  conversationtype:string;
  YahooDir:string;

implementation

uses Unit2, Unit3;

{$R *.dfm}

Function GetDir(yid:string):string;
const
yahoodir = '\SOFTWARE\Yahoo\Essentials\';
var
dir:string;
begin
with TRegistry.Create do
   begin
     RootKey := HKEY_LOCAL_MACHINE;
     if OpenKey(yahoodir,false) then
     begin
       dir:=readstring('MainDir');
       CloseKey;
     end;
   end;
Result:=dir+'\Messenger\Profiles\'+yid+'\';
End;

Function ListFiles(yid:string;folder:string;buddy:string):String;
Begin
Result:=YahooDir+'Archive\'+folder+'\'+buddy;
End;

Function GetYID(fname:string):string;
var
i,j:integer;
Begin
//20050910-username.dat
for i:=10 to length(fname) do
  begin
  if fname[i]='.' then break;
  Result:=Result+fname[i];
  end;
End;

Function GetYIDReg:string;
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

Function Xormessage(fname:String;pos:integer;key:string;length1:integer):string;
var
  FS:TFileStream;
  i,C1, red, n :integer;
  b : byte;
Begin
  result := '';
  if (length1 > 0) and (key <> '') and FileExists(fname) then begin

    FS:=TFileStream.Create(fname,fmopenread or fmsharedenynone);
    try
      if (pos > -1) and (pos <= fs.Size) then begin
        fs.Position := pos;

        SetLength(result, length1);
        C1:=0;     //set counter to zero
        n := 0;
        i := 1;

        red := fs.Read(b, 1);
        while (red > 0) and (i <= length1) do begin
          Inc(C1);
          if C1 > length(key) then C1:=1; //repeat using key if longer than key

          Inc(n);
          result[n] := chr( b xor ord(key[C1]) );

          red := fs.Read(b, 1);
          Inc(i);
        end;

        SetLength(result, n);
      end;

    finally
      fs.free;
    end;

  end;
end;

Function Xormessage1(fname:String;pos:integer;key:string;length1:integer):string;
var
FS:TFileStream;
temp,i,j,C1:integer;
text:string;
Begin
C1:=0;   //set counter to zero
i:=1;


if FileExists(fname) then
begin
  FS:=TFileStream.Create(fname,fmopenread or fmsharedenynone);
  fs.Position:=pos;
  {for i:=1 to length1 do
   begin }

  while (i <= length1) do
  begin
     inc(C1);
     inc(i);

     if C1 > length(key) then C1:=1; //repeat using key if longer than key

     fs.readbuffer(temp,1);
     j:=temp xor ord(key[C1]);
     text:=text+chr(j);

   end;

  fs.free;
  Result:=text;
end;

end;

Function DecryptArchive(fname:string):TStringList;
var
list:TStringList;
FS:TFileStream;
temp,temp1,len,i,j,C1:integer;
tstamp,buffer,pos:integer;
s:string;
Begin
c1:=0;
i:=1;
list:=TStringList.Create;

if auto=true then
    begin
    key:=GetYIDReg;
    end else
    begin
    key:=form2.keytxtbox.Text;
    end;

FS:=TFileStream.Create(fname,fmopenread or fmsharedenynone);
fs.read(tstamp,4); //read timestamp
fs.Position:=fs.Position+16; //go to first entry
fs.read(tstamp,5); //read timestamp
fs.Position:=fs.Position+7;
fs.read(len,1); //read msg length
fs.Position:=fs.Position+3;
//label2.Caption:=inttostr(fs.Position);

list.Add(Xormessage(fname,fs.Position,key,len));

repeat
fs.Position:=fs.Position+len;
fs.Position:=fs.Position+4;
fs.Read(tstamp,5);//read tstamp
fs.Position:=fs.Position+7;
fs.read(len,1); //read msg length
fs.Position:=fs.Position+3;
//label2.Caption:=inttostr(fs.Position);

//showmessage(Xormessage(fname,fs.Position,'username',len));
if  Xormessage(fname,fs.Position,key,len) <> '' then
begin
list.Add(Xormessage(fname,fs.Position,key,len))
end else
begin
if fs.Position= fs.size then
break;
end;
until  fs.position>=fs.Size;

fs.free;

Result:=list;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
FS:TFileStream;
temp,temp1,len,i,j,C1:integer;
tstamp,buffer,pos:integer;
fname,s:string;
begin
c1:=0;
i:=1;
memo1.Clear;

if opendialog1.execute then
begin
  //showmessage(Xormessage(opendialog1.FileName,112,'username',8));
  fname:=opendialog1.filename;
  fname1:=opendialog1.filename;
  edit1.Text:=opendialog1.FileName;
  if auto=true then
    begin
    key:=GetYID(extractfilename(fname1));
    end else
    begin
    key:=form2.keytxtbox.Text;
    end;
  //showmessage(GetYID(ExtractFileName(fname)));


FS:=TFileStream.Create(fname,fmopenread or fmsharedenynone);


fs.read(tstamp,4); //read timestamp
fs.Position:=fs.Position+16; //go to first entry
fs.read(tstamp,5); //read timestamp
fs.Position:=fs.Position+7;
fs.read(len,1); //read msg length
fs.Position:=fs.Position+3;
label2.Caption:=inttostr(fs.Position);

memo1.Lines.Add(Xormessage(fname,fs.Position,key,len));
repeat
fs.Position:=fs.Position+len;
fs.Position:=fs.Position+4;
fs.Read(tstamp,5);//read tstamp
fs.Position:=fs.Position+7;
fs.read(len,1); //read msg length
fs.Position:=fs.Position+3;
//label2.Caption:=inttostr(fs.Position);

//showmessage(Xormessage(fname,fs.Position,'username',len));
if  Xormessage(fname,fs.Position,key,len) <> '' then
begin
memo1.Lines.Add(Xormessage(fname,fs.Position,key,len));
end else
begin
if fs.Position= fs.size then
break;
end;
until  fs.position>=fs.Size;
{for i:=1 to len do
begin
 inc(C1);
 if (C1 >= length(key)) then C1:=1;
 fs.Read(temp1,1);
 j:=temp1 xor ord(key[C1]);
 s:=s+chr(j);
end;
showmessage(s);}

fs.free;
end;

end;

procedure TForm1.Exi1Click(Sender: TObject);
begin
form1.close;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
aboutbox.show;
end;

procedure TForm1.Settings1Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.smileyClick(Sender: TObject);
begin
if form1.Width > 486 then
begin
form1.Width:=486;
end else
begin
form1.Width:=form1.Width*2-200;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
YahooDir:=GetDir(GetYIDReg);
conversationtype:='Messages';
shellcombobox1.ItemIndex:=1;
auto:=True;
//showmessage(ListFiles('username','Messages'));
filelistbox1.Directory:= ListFiles('username',conversationtype,shellcombobox1.SelText);

end;

procedure TForm1.ShellComboBox1Change(Sender: TObject);
begin
filelistbox1.Directory:= ListFiles('username',conversationtype,shellcombobox1.SelText);
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
conversationtype:='Messages';
shellcombobox1.root:=yahoodir+'Archive\'+conversationtype;
shellcombobox1.ItemIndex:=1;
filelistbox1.Directory:= ListFiles('username',conversationtype,shellcombobox1.SelText);

end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
conversationtype:='Conferences';
shellcombobox1.root:=yahoodir+'Archive\'+conversationtype;
shellcombobox1.ItemIndex:=1;
filelistbox1.Directory:= ListFiles('username',conversationtype,shellcombobox1.SelText);
end;

procedure TForm1.Load1Click(Sender: TObject);
begin
//showmessage('I Haven''t done this yet');
showmessage(filelistbox1.Items[filelistbox1.ItemIndex]);
end;

procedure TForm1.FileListBox1DblClick(Sender: TObject);
begin
//showmessage(filelistbox1.Items[filelistbox1.ItemIndex]);
//opendialog1.FileName:=yahoodir+'Archive\'+conversationtype+filelistbox1.Items[filelistbox1.ItemIndex];
memo1.Clear;
memo1.lines:=DecryptArchive(yahoodir+'Archive\'+conversationtype+'\'+shellcombobox1.SelText+'\'+filelistbox1.Items[filelistbox1.ItemIndex]);


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.Close;
end;

end.