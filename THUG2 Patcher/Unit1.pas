unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, ComCtrls, jpeg;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    Information1: TMenuItem;
    About1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioButton4: TRadioButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FS:TFileStream;
  FS2:TFileStream;
  nop:integer;
  nop1:integer;
  temp:integer;
  bytes:array[0..4518260] of byte;
  bytes1:array[0..3926726] of byte;
  bytes2:array[0..3926726] of byte;
  size:integer;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

if radiobutton1.Checked=true then
begin
if fileexists('SLES_526.21') then
begin
edit1.text:='SLES_526.21';
statusbar1.Panels.Items[1].Text:='File Found';
radiogroup1.Enabled:=false;
radiobutton1.Enabled:=false;
radiobutton2.Enabled:=false;
radiobutton3.Enabled:=false;
radiobutton4.Enabled:=false;
checkbox1.Enabled:=true;
checkbox2.Enabled:=true;
checkbox3.enabled:=true;
checkbox4.Enabled:=true;
checkbox5.enabled:=true;
checkbox6.enabled:=true;
groupbox1.Enabled:=true;
end
else
begin
statusbar1.Panels.Items[1].Text:='File Not Found';
showmessage('SLES_526.21 not found in this directory');
end;
end;

if radiobutton2.Checked=true then
begin
if fileexists('THUG2.exe') then
begin
edit1.text:='THUG2.exe';
statusbar1.Panels.Items[1].Text:='File Found';
radiogroup1.Enabled:=false;
radiobutton1.Enabled:=false;
radiobutton2.Enabled:=false;
radiobutton3.Enabled:=false;
radiobutton4.Enabled:=false;
checkbox1.Enabled:=true;
checkbox2.Enabled:=true;
checkbox3.enabled:=true;
checkbox4.Enabled:=true;
checkbox5.enabled:=true;
checkbox6.enabled:=true;
groupbox1.Enabled:=true;
end
else
begin
statusbar1.Panels.Items[1].Text:='File Not Found';
showmessage('THUG2.exe not found in this directory');
end;
end;

if radiobutton3.Checked=true then
begin
if fileexists('default.xbe') then
begin
edit1.text:='default.xbe';
statusbar1.Panels.Items[1].Text:='File Found';
radiogroup1.Enabled:=false;
radiobutton1.Enabled:=false;
radiobutton2.Enabled:=false;
radiobutton3.Enabled:=false;
radiobutton4.Enabled:=false;
checkbox1.Enabled:=true;
checkbox2.Enabled:=true;
checkbox3.enabled:=true;
checkbox4.Enabled:=true;
checkbox5.enabled:=true;
checkbox6.enabled:=true;
groupbox1.Enabled:=true;
end
else
begin
statusbar1.Panels.Items[1].Text:='File Not Found';
showmessage('default.xbe not found in this directory');
end;
end;

if radiobutton4.Checked=true then
begin
if fileexists('SLUS_209.65') then
begin
edit1.text:='SLUS_209.65';
statusbar1.Panels.Items[1].Text:='File Found';
radiogroup1.Enabled:=false;
radiobutton1.Enabled:=false;
radiobutton2.Enabled:=false;
radiobutton3.Enabled:=false;
radiobutton4.Enabled:=false;
checkbox1.Enabled:=true;
checkbox2.Enabled:=true;
checkbox3.enabled:=true;
checkbox4.Enabled:=true;
checkbox5.enabled:=true;
checkbox6.enabled:=true;
groupbox1.Enabled:=true;
end
else
begin
statusbar1.Panels.Items[1].Text:='File Not Found';
showmessage('SLUS_209.65 not found in this directory');
end;
end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
radiogroup1.Enabled:=true;
radiobutton1.Enabled:=true;
radiobutton2.Enabled:=true;
radiobutton3.Enabled:=true;
radiobutton4.enabled:=true;
checkbox1.Enabled:=false;
checkbox2.Enabled:=false;
checkbox3.enabled:=false;
checkbox4.Enabled:=false;
checkbox5.enabled:=false;
checkbox6.enabled:=false;
groupbox1.Enabled:=false;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
form1.close;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
form1.close;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
i:integer;
begin
nop:=$00000000;
nop1:=$90909090;

//Host 8 players with a CAP you create (pc)
   if (radiobutton2.Checked=true) and (checkbox1.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.text,fmopenreadwrite);
      fs.Position:=2421404;
    for i:=0 to 6 do
      begin
        fs.Write(nop1, 4);
      end;
fs.write(nop1, 2);
fs.free;
end;

//Mainmenu level  (pc)
    if (radiobutton2.Checked=true) and (checkbox2.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2447896;
    for i:=0 to 4 do
      begin
        fs.write(nop, 4);
      end;
    fs.Position:=2447976;
    for i:=0 to 2 do
      begin
        fs.write(nop, 4);
      end;
    fs.free;
end;

//go out of bounds  (pc)
  if (radiobutton2.Checked=true) and (checkbox3.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2429428;
    for i:=0 to 2 do
      begin
        fs.write(nop, 4);
      end;
    fs.free;
end;

//perfect balance   (pc)
  if (radiobutton2.Checked=true) and (checkbox4.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2427916;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//remove special items    (pc)
  if (radiobutton2.Checked=true) and (checkbox5.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2426712;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//infinite chat text   (pc)
  if (radiobutton2.Checked=true) and (checkbox6.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2440487;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//Host 8 players with a CAP you create (ps2-pal)
   if (radiobutton1.Checked=true) and (checkbox1.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.text,fmopenreadwrite);
      fs.Position:=3346376;
    for i:=0 to 7 do
      begin
        fs.Write(nop1, 4);
      end;
fs.write(nop1, 2);
fs.free;
end;

//Mainmenu level  (ps2-pal)
    if (radiobutton1.Checked=true) and (checkbox2.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3275128;
    for i:=0 to 3 do
      begin
        fs.write(nop, 4);
      end;
    fs.Position:=3275216;
    for i:=0 to 3 do
      begin
        fs.write(nop, 4);
      end;
      fs.write(nop, 1);
    fs.free;
end;

//go out of bounds  (ps2-pal)
  if (radiobutton1.Checked=true) and (checkbox3.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3295152;
    for i:=0 to 2 do
      begin
        fs.write(nop, 4);
      end;
    fs.free;
end;

//perfect balance   (ps2-pal)
  if (radiobutton1.Checked=true) and (checkbox4.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3296808;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//remove special items    (ps2-pal)
  if (radiobutton1.Checked=true) and (checkbox5.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3298136;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//infinite chat text   (ps2-pal)
  if (radiobutton1.Checked=true) and (checkbox6.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3283579;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//Host 8 players with a CAP you create (ps2-ntsc)
   if (radiobutton4.Checked=true) and (checkbox1.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.text,fmopenreadwrite);
      fs.Position:=3346376;
    for i:=0 to 7 do
      begin
        fs.Write(nop1, 4);
      end;
fs.write(nop1, 2);
fs.free;
end;

//Mainmenu level  (ps2-ntsc)
    if (radiobutton4.Checked=true) and (checkbox2.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3275128;
    for i:=0 to 3 do
      begin
        fs.write(nop, 4);
      end;
    fs.Position:=3275216;
    for i:=0 to 3 do
      begin
        fs.write(nop, 4);
      end;
      fs.write(nop, 1);
    fs.free;
end;

//go out of bounds  (ps2-ntsc)
  if (radiobutton4.Checked=true) and (checkbox3.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3295152;
    for i:=0 to 2 do
      begin
        fs.write(nop, 4);
      end;
    fs.free;
end;

//perfect balance   (ps2-ntsc)
  if (radiobutton4.Checked=true) and (checkbox4.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3296808;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//remove special items    (ps2-ntsc)
  if (radiobutton4.Checked=true) and (checkbox5.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3298136;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//infinite chat text   (ps2-ntsc)
  if (radiobutton4.Checked=true) and (checkbox6.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=3283579;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//Host 8 players with a CAP you create (xbox)
   if (radiobutton3.Checked=true) and (checkbox1.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.text,fmopenreadwrite);
      fs.Position:=2455828;
    for i:=0 to 6 do
      begin
        fs.Write(nop1, 4);
      end;
fs.write(nop1, 2);
fs.free;
end;

//Mainmenu level  (xbox)
    if (radiobutton3.Checked=true) and (checkbox2.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2518080;
    for i:=0 to 4 do
      begin
        fs.write(nop, 4);
      end;
    fs.Position:=2518160;
    for i:=0 to 2 do
      begin
        fs.write(nop, 4);
      end;
    fs.free;
end;

//go out of bounds  (xbox)
  if (radiobutton3.Checked=true) and (checkbox3.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2500952;
    for i:=0 to 2 do
      begin
        fs.write(nop, 4);
      end;
    fs.free;
end;

//perfect balance   (xbox)
  if (radiobutton3.Checked=true) and (checkbox4.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2499440;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//remove special items    (xbox)
  if (radiobutton3.Checked=true) and (checkbox5.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2498236;
    for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

//infinite chat text   (xbox)
  if (radiobutton3.Checked=true) and (checkbox6.Checked=true) then
    begin
      fs:=TFileStream.Create(edit1.Text, fmopenreadwrite);
      fs.position:=2511627;
     for i:=0 to 1 do
      begin
        fs.write(nop, 2);
      end;
    fs.free;
end;

statusbar1.Panels.Items[1].Text:='File Patched';
Showmessage('Sucessfully Patched '+edit1.text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
radiobutton2.Checked:=true;
if radiobutton1.checked=true then
edit1.text:= 'SLES_526.21';
if radiobutton2.checked=true then
edit1.text:= 'THUG2.exe';
if radiobutton3.checked=true then
edit1.text:= 'default.xbe';
if radiobutton4.checked=true then
edit1.text:= 'SLUS_209.65';
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
image1.Picture:=image2.Picture;
label1.caption:='SLES_526.21';
image1.width:=33;
image1.Left:=184;
label1.Left:=168;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
image1.Picture:=image3.picture;
label1.Caption:='THUG2.exe';
image1.width:=41;
image1.Left:=176;
label1.Left:=168;

end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
image1.Picture:=image2.picture;
label1.Caption:='default.xbe';
image1.width:=33;
image1.Left:=184;
label1.Left:=176;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
image1.Picture:=image2.picture;
label1.Caption:='SLUS_209.65';
image1.width:=33;
image1.Left:=184;
label1.Left:=168;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin

if radiobutton1.Checked=true then
begin
if fileexists('SLES_526.21') then
begin
edit1.text:='SLES_526.21';
fs2:=TFileStream.Create('SLES_526.21',fmopenreadwrite);
size:=fs2.Size;
fs2.ReadBuffer(bytes, size{4518260});
fs2.free;
fs2:=TFileStream.create('SLES_526.21.backup',fmOpenWrite or fmCreate);
fs2.Write(bytes, size{4518260});
fs2.free;
statusbar1.Panels.Items[1].Text:='File Backed Up';
Showmessage('Sucessfully Backed Up '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File';
Showmessage('Failed to Backup');
end;
end;

if radiobutton2.Checked=true then
begin
if fileexists('THUG2.exe') then
begin
edit1.text:='THUG2.exe';
fs2:=TFileStream.Create('THUG2.exe',fmopenreadwrite);
size:=fs2.Size;
fs2.ReadBuffer(bytes1, size{3926726});
fs2.free;
fs2:=TFileStream.create('THUG2.exe.backup',fmOpenWrite or fmCreate);
fs2.Write(bytes1, size{3926726});
fs2.free;
statusbar1.Panels.Items[1].Text:='File Backed Up';
Showmessage('Sucessfully Backed Up '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File';
Showmessage('Failed to Backup');
end;
end;

if radiobutton3.Checked=true then
begin
if fileexists('default.xbe') then
begin
edit1.text:='default.xbe';
fs2:=TFileStream.Create('default.xbe',fmopenreadwrite);
size:=fs2.Size;
fs2.ReadBuffer(bytes, size{2813952});
fs2.free;
fs2:=TFileStream.create('default.xbe.backup',fmOpenWrite or fmCreate);
fs2.Write(bytes, size{2813952});
fs2.free;
statusbar1.Panels.Items[1].Text:='File Backed Up';
Showmessage('Sucessfully Backed Up '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File';
Showmessage('Failed to Backup');
end;
end;

if radiobutton4.Checked=true then
begin
if fileexists('SLUS_209.65') then
begin
edit1.text:='SLUS_209.65';
fs2:=TFileStream.Create('SLUS_209.65',fmopenreadwrite);
fs2.ReadBuffer(bytes, 4518260);
fs2.free;
fs2:=TFileStream.create('SLUS_209.65.backup',fmOpenWrite or fmCreate);
fs2.Write(bytes, 4518260);
fs2.free;
statusbar1.Panels.Items[1].Text:='File Backed Up';
Showmessage('Sucessfully Backed Up '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File';
Showmessage('Failed to Backup');
end;
end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin

if radiobutton1.Checked=true then
begin
if fileexists('SLES_526.21.backup') then
begin
edit1.text:='SLES_526.21';
fs2:=TFileStream.Create('SLES_526.21.backup',fmopenreadwrite);
size:=fs2.Size;
fs2.ReadBuffer(bytes, size{4518260});
fs2.free;
fs2:=TFileStream.create('SLES_526.21',fmOpenWrite or fmCreate);
fs2.Write(bytes, size{4518260});
fs2.free;
statusbar1.Panels.Items[1].Text:='File Restored';
Showmessage('Sucessfully Restored '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File or Files';
Showmessage('Failed to restore, file missing SLES_526.21 or SLES_526.21.backup');
end;
end;

if radiobutton2.Checked=true then
begin
if fileexists('THUG2.exe.backup') then
begin
edit1.text:='THUG2.exe';
fs2:=TFileStream.Create('THUG2.exe.backup',fmopenreadwrite);
size:=fs2.Size;
fs2.ReadBuffer(bytes1, size{3926726});
fs2.free;
fs2:=TFileStream.create('THUG2.exe',fmOpenWrite or fmCreate);
fs2.Write(bytes1, size{3926726});
fs2.free;
statusbar1.Panels.Items[1].Text:='File Restored';
Showmessage('Sucessfully Restored '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File or Files';
Showmessage('Failed to restore, file missing THUG2.exe or THUG2.exe.backup');
end;
end;

if radiobutton3.Checked=true then
begin
if fileexists('default.xbe.backup') then
begin
edit1.text:='default.xbe';
fs2:=TFileStream.Create('default.xbe.backup',fmopenreadwrite);
size:=fs2.Size;
fs2.ReadBuffer(bytes, size{2813952});
fs2.free;
fs2:=TFileStream.create('default.xbe',fmOpenWrite or fmCreate);
fs2.Write(bytes, size{2813952});
fs2.free;
statusbar1.Panels.Items[1].Text:='File Restored';
Showmessage('Sucessfully Restored '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File or Files';
Showmessage('Failed to restore, file missing default.xbe or default.xbe.backup');
end;
end;

if radiobutton4.Checked=true then
begin
if fileexists('SLUS_209.65.backup') then
begin
edit1.text:='SLUS_209.65';
fs2:=TFileStream.Create('SLUS_209.65.backup',fmopenreadwrite);
fs2.ReadBuffer(bytes, 4518260);
fs2.free;
fs2:=TFileStream.create('SLUS_209.65',fmOpenWrite or fmCreate);
fs2.Write(bytes, 4518260);
fs2.free;
statusbar1.Panels.Items[1].Text:='File Restored';
Showmessage('Sucessfully Restored '+edit1.Text);
end
else
begin
statusbar1.Panels.Items[1].Text:='Missing File or Files';
Showmessage('Failed to restore, file missing SLUS_209.65 or SLES_209.65.backup');
end;

end;
end;
procedure TForm1.About1Click(Sender: TObject);
begin
aboutbox.showmodal;
end;

end.
