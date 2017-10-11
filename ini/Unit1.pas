unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, iniFiles, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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
var
  ini: TIniFile;
begin
  // Create INI Object and open or create file test.ini
  ini := TIniFile.Create('c:\MyIni.ini');
  try
    // Write a string value to the INI file.
    ini.WriteString('Section_Name', 'Key_Name', 'String Value');
    // Write a integer value to the INI file.
    ini.WriteInteger('Section_Name', 'Key_Name', 2002);
    // Write a boolean value to the INI file.
    ini.WriteBool('Section_Name', 'Key_Name', True);
  finally
    ini.Free;
  end;
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  ini: TIniFile;
  res: string;
begin
  // Create INI Object and open or create file test.ini
  ini := TIniFile.Create('c:\MyIni.ini');
  try
    res := ini.ReadString('Section_Name', 'Key_Name', 'default value');
    MessageDlg('Value of Section:  ' + res, mtInformation, [mbOK], 0);
  finally
    ini.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var 
  ini: TIniFile;
begin
  ListBox1.Clear;
  ini := TIniFile.Create('MyIni.ini');
  try
    ini.ReadSections(listBox1.Items);
  finally 
    ini.Free; 
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var 
  ini: TIniFile;
begin
  ini:= TIniFile.Create('WIN.INI');
  try
    ini.ReadSection('Desktop', ListBox1.Items);
  finally
    ini.Free;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('WIN.INI');
  try
    ini.ReadSectionValues('Desktop', ListBox1.Items);
  finally 
    ini.Free;  
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var 
  ini: TIniFile;
begin
  ini := TIniFile.Create('MyIni.ini');
  try
    ini.EraseSection('My_Section');
  finally
    ini.Free;
  end;
end;

end.
