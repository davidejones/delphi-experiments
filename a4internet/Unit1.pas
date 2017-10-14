unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Memo2: TMemo;
    IdHTTP1: TIdHTTP;
    Label5: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
 aStream: TMemoryStream;
 POSTData:TStringList;

begin
aStream := TMemoryStream.create;
 POSTData := TStringList.create;
try
   with IdHTTP1 do
   begin
     POSTData.Text:='recipient='+ edit1.Text;
     POSTData.Add('&email='+edit2.Text);
     POSTData.Add('&subject='+edit3.text);
     POSTData.Add('&comments='+memo2.Text);
     Request.ContentType := 'application/x-www-form-urlencoded';
     try
       Post('http://www.a4internet.com/cgi-bin/mailform.pl', POSTData, aStream);
       showmessage('Email Sent!');
     except
       on E: Exception do
         showmessage('Error encountered during POST: ' + E.Message);
     end;
   end;
{ aStream.WriteBuffer(#0' ', 1);
 aStream.Position := 0;
 Memo1.Lines.LoadFromStream(aStream); }

 except
 end;
end;


end.
