object Form1: TForm1
  Left = 198
  Top = 116
  BorderStyle = bsToolWindow
  Caption = 'Wad Extractor'
  ClientHeight = 522
  ClientWidth = 358
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
  object Button2: TButton
    Left = 488
    Top = 120
    Width = 74
    Height = 25
    Caption = 'List Files'
    TabOrder = 0
    OnClick = Button2Click
  end
  object ListBox2: TListBox
    Left = 440
    Top = 152
    Width = 120
    Height = 97
    ItemHeight = 13
    TabOrder = 1
  end
  object ListBox3: TListBox
    Left = 440
    Top = 264
    Width = 120
    Height = 97
    ItemHeight = 13
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 344
    Height = 81
    Caption = 'Open File'
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 160
      Height = 39
      Caption = 
        'Select the hed file to open (make sure the corresponding wad fil' +
        'e is in the same directory)'
      WordWrap = True
    end
    object Button3: TButton
      Left = 224
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Open File'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 344
    Height = 417
    Caption = 'Extract File'
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 245
      Height = 13
      Caption = 'Select a file from the list below then click extract file.'
    end
    object ListBox1: TListBox
      Left = 8
      Top = 80
      Width = 329
      Height = 321
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object Button1: TButton
      Left = 6
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Extract File'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Button4: TButton
    Left = 240
    Top = 144
    Width = 107
    Height = 25
    Caption = 'List File Name Only'
    Enabled = False
    TabOrder = 5
    Visible = False
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 320
    Top = 48
    object File1: TMenuItem
      Caption = 'File'
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Settings1: TMenuItem
      Caption = 'Settings'
      object Configuration1: TMenuItem
        Caption = 'Configuration'
        OnClick = Configuration1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
end
