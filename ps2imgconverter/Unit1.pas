//not working need to delete 14 bytes after writing header

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ComboBox1: TComboBox;
    ProgressBar1: TProgressBar;
    Image2: TImage;
    Panel1: TPanel;
    Image3: TImage;
    Image4: TImage;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fname,newnametga,newnameimg:string;
  bytes: array [0..573472] of byte;
  fsize:integer;
implementation

{$R *.dfm}

USES
    Targa;

procedure DeleteStreamPart(Stream: TStream; Index, Count: Int64);
    var tempStream: TMemoryStream;
            sSize, tSize: Int64;
begin
    sSize := Stream.Size;
    tSize := sSize - Count - Index;
    TempStream := TMemoryStream.Create;
    try
        TempStream.SetSize(tSize);
        Stream.Position := Index + Count;
        TempStream.CopyFrom(Stream, tSize);
        Stream.Position := Index;
        TempStream.Position := 0;
        Stream.CopyFrom(TempStream, tSize);
        Stream.Size := sSize - Count; //if you want to trim it
    finally
        TempStream.Free;
    end;
end;

procedure TForm1.Image1Click(Sender: TObject);
var
FS:TFileStream;
compression:integer;
Bitmap:TBitmap;
begin
progressbar1.Position:=0;

if combobox1.Text=' .ps2 -----> .tga' then begin
opendialog1.Filter:='PS2 Image (*.ps2)|*.ps2';
end;

if combobox1.Text=' .tga -----> .ps2' then begin
opendialog1.Filter:='Targa (*.tga)|*.tga';
end;

if combobox1.Text=' .psp ----> .tga' then begin
opendialog1.Filter:='PSP Image (*.psp)|*.psp';
end;

  if opendialog1.execute then
  begin
  try
    fname:=opendialog1.filename;
    FS := TFileStream.Create(fname,fmOpenRead or fmShareDenyNone);
    fsize:=fs.Size;
    fs.Position:=16;
    fs.ReadBuffer(compression, 4);
    fs.Position:=0;
      if compression=$00000013 then
      begin
        Showmessage('This is a compressed file and will not be converted properly');
      end;
    fs.free;
  except
on E : Exception do
begin
//ShowMessage(E.Message);
MessageDlg ('You must load a file before you can scan it.', mtinformation, [mbOk], 0)
end;
end;
end;
if combobox1.text=' .tga -----> .img' then
begin
Bitmap := TBitmap.Create;
    TRY
      LoadFromFileX(fname, Bitmap);
      image3.Picture.Graphic := Bitmap
   FINALLY
      Bitmap.Free
    END;
end;
end;


procedure TForm1.Image4Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.Image2Click(Sender: TObject);
var
F2:TMemoryStream;
FS, FS2,F1:TFileStream;
buffer,fsize2,Temp,pos:integer;
Bitmap:  TBitmap;
bytes: array [0..573472] of byte;
begin
if combobox1.text=' .ps2 -----> .tga' then
begin
  progressbar1.Position:=0;
  newnametga:=ChangeFileExt(fname, '.tga');
  F2:= TMemoryStream.Create;
  F1:= TFileStream.Create(fname,fmopenread or fmsharedenynone);
  F2.CopyFrom(F1,0);
  F1.free;
  F2.SaveToFile(newnametga);
  F2.free;
  progressbar1.Position:=10;
  FS:=TFileStream.create(fname,fmopenread or fmsharedenynone);
  fs.position:=28;
  fs.ReadBuffer(fsize2,4);
  fs.Position:=0;
  fs.Free;

  FS2 := TFileStream.Create(newnametga , fmOpenReadWrite);

  //fs.ReadBuffer(Temp,32); // 4 => Count of bytes to read and temp = interger (to read 4 bytes LittleEndian to the temp value) might be 8 i read that an integer is 4 bytes
  fs2.Position:=0;
  Temp:=$00020000;
  fs2.Write(Temp,4);
  //s1:=inttohex(temp,4);
  //memo1.Text:=s1;
  progressbar1.Position:=30;

  Temp:=$00000000;
  fs2.Write(Temp,4);
  progressbar1.Position:=60;

  Temp:=$00000000;
  fs2.Write(Temp,4);
  progressbar1.Position:=70;

  fs2.Write(fsize2,4);

  Temp:=$0810;
  fs2.Write(Temp,2);
  progressbar1.Position:=100;

  fs2.Position:=0;
  DeleteStreamPart(fs2, 18, 14); //deleting 14 bytes from 18.
  fs2.free; // to close the file}

  Bitmap := TBitmap.Create;
    TRY
      LoadFromFileX(newnametga, Bitmap);
      image3.Picture.Graphic := Bitmap
   FINALLY
      Bitmap.Free
    END;
   progressbar1.Position:=0;
  end else if combobox1.text=' .tga -----> .ps2' then begin
  //showmessage('Haven''t Coded tga into img yet');
  progressbar1.Position:=0;
  newnameimg:=ChangeFileExt(fname, '.ps2');
  FS:=TFileStream.Create(fname, fmopenread or fmsharedenynone);
  fs.ReadBuffer(bytes,fsize);
  fs.position:=12;
  fs.ReadBuffer(fsize2,4);
  fs.free;


  {F2:= TMemoryStream.Create;
  F1:= TFileStream.Create(fname,fmopenread or fmsharedenynone);
  F2.CopyFrom(F1,0);
  F1.free;
  F2.SaveToFile(newnameimg);
  F2.free;
  progressbar1.Position:=10;
  FS:=TFileStream.create(fname,fmopenread or fmsharedenynone);
  fs.position:=12;
  fs.ReadBuffer(fsize2,4);
  fs.Position:=0;
  fs.Free; }

  FS2 := TFileStream.Create(newnameimg , fmOpenWrite or fmCreate);
  //fs.ReadBuffer(Temp,32); // 4 => Count of bytes to read and temp = interger (to read 4 bytes LittleEndian to the temp value) might be 8 i read that an integer is 4 bytes
  fs2.Position:=0;
  Temp:=$00000002;
  fs2.Write(Temp,4);
  //s1:=inttohex(temp,4);
  //memo1.Text:=s1;
  progressbar1.Position:=30;

  Temp:=$00000000;
  fs2.Write(Temp,4);
  progressbar1.Position:=60;

  Temp:=$00000009;
  fs2.Write(Temp,4);
  progressbar1.Position:=70;

  Temp:=$00000008;
  fs2.Write(Temp,4);

  Temp:=$00000002;
  fs2.Write(Temp,4);

  Temp:=$00000000;
  fs2.Write(Temp,4);

  Temp:=$00000000;
  fs2.Write(Temp,4);

  fs2.Write(fsize2,4);

  fs.write(bytes[18],fsize{524320});
  fs2.Position:=fs2.Position-18;
  pos:=fs2.Position;
  DeleteStreamPart(fs2, pos,18);
  progressbar1.Position:=100;
  fs2.Free;

  Showmessage('converted, better check it in hex editor just incase');

  {fs2.Position:=0;
  DeleteStreamPart(fs2, 18, 14); //deleting 14 bytes from 18.
  fs2.free; // to close the file}

  end else if combobox1.text=' .psp ----> .tga' then
  begin
  progressbar1.Position:=0;
  newnametga:=ChangeFileExt(fname, '.tga');
  F2:= TMemoryStream.Create;
  F1:= TFileStream.Create(fname,fmopenread or fmsharedenynone);
  F2.CopyFrom(F1,0);
  F1.free;
  F2.SaveToFile(newnametga);
  F2.free;
  progressbar1.Position:=10;
  FS:=TFileStream.create(fname,fmopenread or fmsharedenynone);
  fs.position:=28;
  fs.ReadBuffer(fsize2,4);
  fs.Position:=0;
  fs.Free;

  FS2 := TFileStream.Create(newnametga , fmOpenReadWrite);

  //fs.ReadBuffer(Temp,32); // 4 => Count of bytes to read and temp = interger (to read 4 bytes LittleEndian to the temp value) might be 8 i read that an integer is 4 bytes
  fs2.Position:=0;
  Temp:=$00020000;
  fs2.Write(Temp,4);
  //s1:=inttohex(temp,4);
  //memo1.Text:=s1;
  progressbar1.Position:=30;

  Temp:=$00000000;
  fs2.Write(Temp,4);
  progressbar1.Position:=60;

  Temp:=$00000000;
  fs2.Write(Temp,4);
  progressbar1.Position:=70;

  fs2.Write(fsize2,4);

  Temp:=$2020;
  fs2.Write(Temp,2);
  progressbar1.Position:=100;

  fs2.Position:=0;
  DeleteStreamPart(fs2, 18, 14); //deleting 14 bytes from 18.
  fs2.free; // to close the file}

  Bitmap := TBitmap.Create;
    TRY
      LoadFromFileX(newnametga, Bitmap);
      image3.Picture.Graphic := Bitmap
   FINALLY
      Bitmap.Free
    END;
   progressbar1.Position:=0;
  end;
 end;


procedure TForm1.Button1Click(Sender: TObject);
 VAR
    Bitmap:  TBitmap;
begin
  Bitmap := TBitmap.Create;
  TRY
    LoadFromFileX(newnametga, Bitmap);
    image3.Picture.Graphic := Bitmap
  FINALLY
    Bitmap.Free
  END;
end;

end.




