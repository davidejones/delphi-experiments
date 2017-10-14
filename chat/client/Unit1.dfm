object Form1: TForm1
  Left = 207
  Top = 100
  BorderStyle = bsSingle
  Caption = 'Client'
  ClientHeight = 517
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button21: TButton
    Left = 160
    Top = 424
    Width = 89
    Height = 25
    Caption = 'setdesktop'
    TabOrder = 24
    OnClick = Button21Click
  end
  object Button1: TButton
    Left = 64
    Top = 8
    Width = 75
    Height = 25
    Caption = 'connect'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 8
    Width = 75
    Height = 25
    Caption = 'disconnect'
    TabOrder = 1
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 88
    Width = 257
    Height = 225
    ItemHeight = 13
    TabOrder = 2
  end
  object hostbox: TEdit
    Left = 16
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '127.0.0.1'
  end
  object portbox: TEdit
    Left = 144
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '21'
  end
  object Button3: TButton
    Left = 200
    Top = 320
    Width = 33
    Height = 25
    Caption = 'Send'
    TabOrder = 5
    OnClick = Button3Click
  end
  object msgbox: TEdit
    Left = 16
    Top = 320
    Width = 177
    Height = 21
    TabOrder = 6
    Text = 'msgbox'
    OnKeyPress = msgboxKeyPress
  end
  object Button4: TButton
    Left = 16
    Top = 352
    Width = 57
    Height = 25
    Caption = 'OpenCD'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 72
    Top = 352
    Width = 65
    Height = 25
    Caption = 'CloseCD'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 240
    Top = 320
    Width = 33
    Height = 25
    Caption = 'Clear'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 136
    Top = 352
    Width = 73
    Height = 25
    Caption = 'MonitorON'
    TabOrder = 10
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 208
    Top = 352
    Width = 65
    Height = 25
    Caption = 'MonitorOFF'
    TabOrder = 11
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 16
    Top = 376
    Width = 57
    Height = 25
    Caption = 'Rebootwin'
    TabOrder = 12
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 72
    Top = 376
    Width = 65
    Height = 25
    Caption = 'KillTaskmgr'
    TabOrder = 13
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 136
    Top = 376
    Width = 73
    Height = 25
    Caption = 'StartTaskmgr'
    TabOrder = 14
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 208
    Top = 376
    Width = 65
    Height = 25
    Caption = 'Screenshot'
    TabOrder = 15
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 16
    Top = 400
    Width = 57
    Height = 25
    Caption = 'msg'
    TabOrder = 16
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 72
    Top = 400
    Width = 89
    Height = 25
    Caption = 'hidedeskshrtcut'
    TabOrder = 17
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 160
    Top = 400
    Width = 89
    Height = 25
    Caption = 'showdeskshrtcut'
    TabOrder = 18
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 16
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Disabletaskbar'
    TabOrder = 19
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 88
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Enabletaskbar'
    TabOrder = 20
    OnClick = Button17Click
  end
  object Button18: TButton
    Left = 16
    Top = 448
    Width = 81
    Height = 25
    Caption = 'Record Sound'
    TabOrder = 21
    OnClick = Button18Click
  end
  object Button19: TButton
    Left = 96
    Top = 448
    Width = 105
    Height = 25
    Caption = 'Stop Record Sound'
    TabOrder = 22
    OnClick = Button19Click
  end
  object Button20: TButton
    Left = 200
    Top = 448
    Width = 73
    Height = 25
    Caption = 'Save Sound'
    TabOrder = 23
    OnClick = Button20Click
  end
  object Button22: TButton
    Left = 104
    Top = 472
    Width = 75
    Height = 25
    Caption = 'BrowseURL'
    TabOrder = 25
    OnClick = Button22Click
  end
  object Button23: TButton
    Left = 16
    Top = 472
    Width = 89
    Height = 25
    Caption = 'DownloadSound'
    TabOrder = 26
    OnClick = Button23Click
  end
  object Button24: TButton
    Left = 176
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Uploadfile'
    TabOrder = 27
    OnClick = Button24Click
  end
  object IdTCPClient1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    OnDisconnected = IdTCPClient1Disconnected
    OnConnected = IdTCPClient1Connected
    Port = 0
    Left = 16
    Top = 8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 232
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      OnClick = Options1Click
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
      object Support1: TMenuItem
        Caption = 'Support'
        OnClick = Support1Click
      end
      object Help2: TMenuItem
        Caption = 'Help'
        OnClick = Help2Click
      end
    end
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 272
    Top = 40
  end
  object OpenDialog1: TOpenDialog
    Left = 264
    Top = 72
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 264
    Top = 104
  end
end
