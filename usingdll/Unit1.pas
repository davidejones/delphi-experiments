unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

procedure DllMessage; external 'Project1.dll'
procedure DllMessage1; external 'Project1.dll'
procedure jumblepass(pass:PChar); external 'Project1.dll'
//Function jumblepass(pass:string):string; external 'Project1.dll'
procedure shakeform; external 'Project1.dll'
Function Encrypt(s:PChar;key:PChar):PChar; external 'Project1.dll'

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Dllmessage;
Dllmessage1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
jumblepass(PChar(label1.Caption));
//edit1.text:=jumblepass(label1.Caption);
//shakeform;
end;

procedure TForm1.Button3Click(Sender: TObject);

begin
showmessage(format('%s',[(Encrypt('tester','testdude'))]));


end;

end.
