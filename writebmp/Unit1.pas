unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Type
 TBmpHeader = Packed Record
  bfType1         : Byte;
  bfType2         : Byte;
  bfSize          : LongInt;
  bfReserved1     : Word;
  bfReserved2     : Word;
  bfOffBits       : LongInt;
  biSize          : LongInt;
  biWidth         : LongInt;
  biHeight        : LongInt;
  biPlanes        : Word;
  biBitCount      : Word;
  biCompression   : LongInt;
  biSizeImage     : LongInt;
  biXPelsPerMeter : LongInt;
  biYPelsPerMeter : LongInt;
  biClrUsed       : LongInt;
  biClrImportant  : LongInt;
 End ;

   // Each pixel is a combination of Blue, Green and Red Values
   // In other words, A pixel is uniquely represented by 3 bytes
   // Maximum Value of any of them is $FF (255 in Decimal)
   TRGB = Record
         rgbBlue : BYTE;  //intensity of blue in the color
         rgbGreen: BYTE;  //intensity of green in the color
         rgbRed  : BYTE;  //intensity of red in the color
   End;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
 Var
  MyBitmapHeader : TBmpHeader;
  MyRGB : TRGB;  //TRGBQUAD;
  MyFile : File;
  MyBuffer : Byte ;

  i, j : Integer;
begin
  With MyBitmapHeader do
  Begin
    bfType1         :=  $42;  
    bfType2         :=  $4D;  
    bfSize          :=  $00000000;
    bfReserved1     :=  $0000;
    bfReserved2     :=  $0000;
    bfOffBits       :=  $36; 
    biSize          :=  $28;
    biWidth         :=  $00000064;
    biHeight        :=  $00000064;
    biPlanes        :=  $0001;
    biBitCount      :=  $0018;
    biCompression   :=  $00000000;
    biSizeImage     :=  $00000000;
    biXPelsPerMeter :=  $00000000;
    biYPelsPerMeter :=  $00000000;
    biClrUsed       :=  $00000000;
    biClrImportant  :=  $00000000;
  end;

  //Open output file
  AssignFile(MyFile, 'HelloWorld.BMP');
  Rewrite(MyFile,1);

  //Finish writing the Header
  BlockWrite (MyFile, MyBitmapHeader, SizeOf(TBmpHeader)); 


  //Now starts the data part

  MyRGB.rgbBlue :=$FF;
  MyRGB.rgbGreen  := $cc;
  MyRGB.rgbRed := $FF;

  //  This will be a pale magenta color 
  //  For Bright Red:-   Blue = $00, Green =$00 and Red= $FF 


  for i:= 1 to 100 do
  begin
     for j:= 1 to 100 do
     begin
         BlockWrite(MyFile, MyRGB, 3); //Block size is 3 bytes
     end;
    //Two Zeroes should be padded
    //to make each row a multiple of 4
    // ie,  10 mod 4  = 2 (zeroes should be 
    //padded two times)
    MyBuffer := $00;
    //BlockWrite(MyFile, MyBuffer, 1);
    //MyBuffer := $00;
    //BlockWrite(MyFile, MyBuffer, 1);

 end;

  CloseFile(MyFile);
  ShowMessage ('BMP file is successfully written!');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Caption:= 'Davids 24 bit BMP creation demonstration';
  Button1.Caption:= 'Write my BMP';
end;

end.
