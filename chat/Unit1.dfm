object Form1: TForm1
  Left = 129
  Top = 98
  Width = 379
  Height = 398
  Caption = 'Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 88
    Top = 8
    Width = 89
    Height = 21
    TabOrder = 1
    Text = '127.0.0.1'
  end
  object Edit2: TEdit
    Left = 184
    Top = 8
    Width = 33
    Height = 21
    TabOrder = 2
    Text = '21'
    OnKeyPress = Edit2KeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 345
    Width = 371
    Height = 19
    Panels = <
      item
        Text = 'Status'
        Width = 50
      end
      item
        Text = 'statusmsg'
        Width = 50
      end>
  end
  object Button2: TButton
    Left = 288
    Top = 8
    Width = 75
    Height = 25
    Caption = 'disconnect'
    TabOrder = 4
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 40
    Width = 353
    Height = 225
    ItemHeight = 13
    TabOrder = 5
  end
  object Button3: TButton
    Left = 288
    Top = 272
    Width = 75
    Height = 25
    Caption = 'send'
    TabOrder = 6
    OnClick = Button3Click
  end
  object msgbox: TEdit
    Left = 8
    Top = 272
    Width = 273
    Height = 21
    TabOrder = 7
    Text = 'msgbox'
  end
  object name: TEdit
    Left = 224
    Top = 8
    Width = 57
    Height = 21
    TabOrder = 8
    Text = 'User'
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <
      item
        IP = '80.0.80.162'
        Port = 23
      end>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = IdTCPServer1Connect
    OnExecute = IdTCPServer1Execute
    OnDisconnect = IdTCPServer1Disconnect
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 344
  end
  object IdTCPClient1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
    Left = 328
    Top = 304
  end
  object IdIPWatch1: TIdIPWatch
    Active = False
    HistoryFilename = 'iphist.dat'
    Left = 8
    Top = 312
  end
end
