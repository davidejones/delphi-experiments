unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Options1: TMenuItem;
    Debug1: TMenuItem;
    SaveOutput1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    Label3: TLabel;
    Button5: TButton;
    About1: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Label4: TLabel;
    Image3: TImage;
    Image4: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Debug1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveOutput1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
   { Public declarations }
  end;

var
  Form1: TForm1;
  fname:string;
implementation


type
       TByteID = array[0..3]of byte;

       function ByteIDToStr(ByteID: TByteID): string;
       begin
       result := Format('%.2x %.2x %.2x %.2x', [ByteID[0], ByteID[1], ByteID[2], ByteID[3]]);
       end;

       function ExtractMeanings(const Filename: string; Offset: integer; Strs: TStrings): integer;

                 function NxtSep(const s: string; iFrom: integer): integer;
                 begin
                   result := iFrom +1;
                   while (result <= Length(s)) and (s[result] <> '+') do
                     Inc(result);

                   if result > Length(s) then
                     result := -1;
                 end;

       var
         FS : TFileStream;
         buffer : string;
         a, b, len : integer;
         ByteID : TByteID;
         Meaning : string;
       begin
         result := -1; //failed

         if FileExists(Filename) then begin
           FS := TFileStream.Create(Filename, fmOpenRead or fmShareDenyNone);
           try
             if FS.Size > Offset then begin
               FS.Seek(Offset, soFromBeginning);
               SetLength(buffer, FS.Size -Offset);
               FS.Read(buffer[1], FS.Size -Offset);

               a := 1;
               if buffer[a] = '+' then begin
                 b := NxtSep(buffer, a);
                 while a > 0 do begin
                   MoveMemory(@ByteID[0], @buffer[a +1], 4);

                   if b < 0 then
                     len := Length(buffer) -(a +4)
                   else
                     len := b -a -4;

                   Meaning := Copy(buffer, a +5, len);

                   Strs.Add(ByteIDToStr(ByteID) +'=' +Meaning);


                   a := b;
                   b := NxtSep(buffer, a);
                 end;

               end;
               result := Strs.Count;

             end;
           finally
             FS.Free;
           end;
         end;
       end;

       function ByteIDMeaning(ByteID: TByteID; Strs: TStrings): string;
       var
         dx : integer;
       begin
         result := '';

         dx := Strs.IndexOfName( ByteIDToStr(ByteID) );
         if dx > -1 then
           result := Strs.ValueFromIndex[dx];
       end;

       function ByteIDStrMeaning(const ByteIDStr: string; Strs: TStrings): string;
       var
         dx : integer;
       begin
         result := '';

         dx := Strs.IndexOfName( ByteIDStr );
         if dx > -1 then
           result := Strs.ValueFromIndex[dx];

        end;

function MeaningsOffset(const Filename: string): integer;
       var
         buffer : array[0..1024]of byte;
         red, fpos, i : integer;
         FS : TFileStream;
       begin
         result := -1;
         // offset marker = $01 $2B

         if FileExists(Filename) then begin
           FS := TFileStream.Create(Filename, fmOpenRead or fmShareDenyNone);
           try
             FS.Position := 0;
             fpos := 0;
             red := FS.Read(buffer[0], 1024);
             while (red > 0) and (result < 0) do begin
               if (red = 1024) and (buffer[red -1] = $01) then begin
                 //partial, so backup
                 Dec(red);
                 FS.Seek(-1, soFromCurrent);
               end;

               i := 0;
               while (i < red -1) and (result < 0) do begin
                 if (buffer[i] = $01) and (buffer[i +1] = $2B) then
                   result := fpos +i +1;
                 Inc(i);
               end;

               Inc(fpos, red);
               red := FS.Read(buffer[0], 1024);
             end;
           finally
             FS.Free;
           end;
         end;
       end;

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
var
  F : string;
  FS, fs2:TFileStream;
  offset1:integer;
  buffer:integer;
begin
  (*
       The file offset of the 'Meanings' section was found using
       a hex editor. There is probably a way to find it in the
       file header but I did not spend much time looking for
       it.

       Replace 'C:\Program Files\Borland\Delphi7\~tmp\' with the
       correct path.
  *)
  //F := 'E:\cas_ped_f.qb'; // $25D9
  //F := 'C:\Program Files\Borland\Delphi7\~tmp\cas_ped_m.qb'; // $3532
  if opendialog1.execute then begin
  fname:=opendialog1.FileName;
  ListBox1.Clear;
  ListBox2.Clear;

  {FS:=TFileStream.Create(F, fmOpenRead or fmShareDenyNone);
  Repeat
    fs.Read(buffer, 2);
    if fs.position = fs.size then break; // jump out of the loop if EoF reached
  Until buffer = 11009;
  offset1:=fs.Position-1;
  showmessage(inttostr(offset1));
  fs.free; }
   ExtractMeanings(fname, MeaningsOffset(Fname), ListBox1.Items);
  //ExtractMeanings(F, offset1, ListBox1.Items);
  //ExtractMeanings(F, $3532, ListBox1.Items);

  (*
       ListBox1.Items can be saved/loaded to/from a file.
  *)
  end;
   end;

procedure TForm1.Button2Click(Sender: TObject);
const
  ByteID : TByteID = ($83, $BC, $8B, $48);
begin

  //lookup ByteID...
  showmessage( ByteIDMeaning(ByteID, ListBox1.Items) );
end;

procedure TForm1.Button3Click(Sender: TObject);
var
FS:TFileStream;
buffer,buffer1,buffer2,buffer3, temp,i:integer;
bytes:array [0..3] of byte;
ByteID:TByteID;
readable, readable1,s,s2,d:string;
pos,count,count2:integer;
Alphabet  : Set of 'A'..'z';     // Set of all letters
begin
Alphabet  := ['A'..'z'];
button1.Click;
 FS:=TFileStream.Create(fname,fmOpenRead or fmShareDenyNone);
 repeat
 fs.ReadBuffer(bytes[0],1);

 if fs.Size = fs.Position then break; //jump out of loop

 {if bytes[0]=$23 then begin
 listbox2.items.Add('23');
 end else }
 if bytes[0]=$01 then begin
 fs.ReadBuffer(buffer,1);
  if buffer = 43 then begin
  Repeat
  for i:=0 to 3 do begin
  fs.Read(temp,1);
  if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if temp <> 0 then readable:= readable  +IntToHex(temp,1);
  end;
  Repeat
  fs.Read(temp, 1);
    if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if temp <> 0 then readable1:= readable1 + Chr(temp);
  Until temp = 0;
  Listbox2.Items.Add(readable+' :: '+readable1);
  readable:='';
  readable1:='';
  fs.Position:=fs.Position+1;
  Until fs.Position = fs.Size;
  end else if
  buffer = 22 then begin
  FS.Read(ByteID[0], 4);
  fs.Position:=fs.Position-4;
  for i:=0 to 3 do begin
  fs.ReadBuffer(buffer1,1);
  if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if buffer1 <> 0 then readable:= readable +IntToHex(buffer1,2) +' ';
  end;
  s := ByteIDMeaning(ByteID, ListBox1.Items);
  //listbox2.Items.Add('01');
  listbox2.Items.Add('0116 ' +readable +'->' +' ' +s);
  readable:='';
  //Listbox2.Items.Add('0116');
  end;
 end else
 if bytes[0]=$16 then begin
 FS.Read(ByteID[0], 4);
  fs.Position:=fs.Position-4;
  for i:=0 to 3 do begin
  fs.ReadBuffer(buffer1,1);
  if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if buffer1 <> 0 then readable:= readable +IntToHex(buffer1,2) +' ';
  end;
  s := ByteIDMeaning(ByteID, ListBox1.Items);
  listbox2.Items.Add('16 ' +readable +' ->' +' ' +s);
  readable:='';

 end else
 if bytes[0]=$1B then begin
 fs.readbuffer(buffer,4);
 fs.ReadBuffer(buffer1,1);
 fs.ReadBuffer(buffer2,1);
 if (char(buffer1) in Alphabet) and (char(buffer2) in Alphabet) then begin
 fs.ReadBuffer(buffer2,1);
 if char(buffer2) in Alphabet then begin
 fs.Position:=fs.position-3;
 listbox2.items.Add('1B' + ' ' + IntToHex(buffer,8));
   Repeat
    fs.Read(temp, 1);
    if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if temp <> 0 then readable:= readable + Chr(temp);
  Until temp = 0;
  //listbox2.items.Add('1B' + ' ' + IntToHex(buffer,8)+' :'+readable);
 listbox2.Items.Add(readable);
 readable:='';
 end
 end
 end {else
 if bytes[0]=$02 then begin
 listbox2.items.Add('02');
 end else
 if bytes[0]=$2B then begin
 listbox2.Items.Add('2B');
 //read 4 bytes then read ascii
 end} else
 If bytes[0]=$07 then begin
 fs.ReadBuffer(buffer,1);
  if buffer=3 then begin
  listbox2.Items.Add('07 03');
  end else
  if buffer=23 then begin
  for i:=0 to 3 do begin
  fs.ReadBuffer(buffer3,1);
  d:=d+(IntToHex(buffer3,2))+' ';
  end;
  listbox2.Items.Add('07 17');
  listbox2.Items.Add(d);
  d:='';
  end else
  if buffer=22 then begin
  FS.Read(ByteID[0], 4);
  fs.Position:=fs.Position-4;
  for i:=0 to 3 do begin
  fs.ReadBuffer(buffer1,1);
  if fs.position = fs.size then break; // jump out of the loop if EoF reached
    if buffer1 <> 0 then readable:= readable +IntToHex(buffer1,2) +' ';
  end;
  s := ByteIDMeaning(ByteID, ListBox1.Items);
  listbox2.Items.Add('0716 ' +readable +'->' +' ' +s);
  readable:='';
  end

  else begin
  fs.Position:=fs.position-1;
  listbox2.Items.Add('07');
  end;
 end else
 begin
 count:=count+1;
 s2:=s2+(IntToHex(bytes[0],2))+' ';
 if count= 4 then begin
 Listbox2.Items.Add(s2);
 count2:=count2+1;
 s2:='';
 count:=0;
 {if count2=2 then begin
 Listbox2.Items.Add('');
 count2:=0;
 end;}
 end;
 end;
 Until fs.Size = fs.Position;
 fs.free;

end;
procedure TForm1.Debug1Click(Sender: TObject);
begin
//form1.ClientHeight:=466;
//form1.ClientWidth:=370;
if form1.ClientWidth=370 then begin
form1.ClientHeight:=481;
form1.ClientWidth:=711;
listbox1.Visible:=true;
button1.Visible:=true;
button2.Visible:=true;
button4.Visible:=true;
label2.Visible:=true;
label1.Visible:=true;
label3.Visible:=true;
end else begin
form1.ClientHeight:=466;
form1.ClientWidth:=370;
listbox1.Visible:=false;
button1.Visible:=false;
button2.Visible:=false;
button4.Visible:=false;
label2.Visible:=false;
label1.Visible:=false;
label3.Visible:=false;
end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//debug1.Visible:=false;
end;

procedure TForm1.SaveOutput1Click(Sender: TObject);
var
myfile:Textfile;
begin
if savedialog1.execute then begin
listbox2.Items.SaveToFile(savedialog1.FileName);
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  FS : TFileStream;
  ByteID : TByteID;
  red : integer;
  s : string;
begin
  FS := TFileStream.Create(fname, fmOpenRead or fmShareDenyNone);
  try
    FS.Position := 0;

    red := FS.Read(ByteID[0], 4);
    while red = 4 do begin
      s := ByteIDMeaning(ByteID, ListBox1.Items);
      if s <> '' then
        if MessageBox(Handle,
                      PChar('''' +s +'''' +#10#10+ 'Continue?'),
                      PChar( ByteIDToStr(ByteID) ),
                      MB_ICONQUESTION OR MB_YESNO) = IDNO then exit;

      red := FS.Read(ByteID[0], 4);
    end;
  finally
    fs.free;
  end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
myfile:Textfile;
begin
if savedialog1.execute then begin
listbox2.Items.SaveToFile(savedialog1.FileName);
end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
showmessage('Created By Invisible Man');
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
button3.Click;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
button5.Click;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
showmessage('Created By Invisible Man');
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
form1.Close;
end;

end.
