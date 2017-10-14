object Form2: TForm2
  Left = 379
  Top = 220
  Width = 393
  Height = 421
  Caption = 'Settings'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 369
    Height = 81
    Caption = 'Decrypt Key'
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 32
    Width = 177
    Height = 17
    Caption = 'Use Specified Key (yahoo id)'
    TabOrder = 1
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 264
    Top = 32
    Width = 89
    Height = 17
    Caption = 'Automatic'
    Checked = True
    TabOrder = 2
    TabStop = True
    OnClick = RadioButton2Click
  end
  object keytxtbox: TEdit
    Left = 24
    Top = 56
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
    Text = 'MyYahooID'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 96
    Width = 369
    Height = 105
    Caption = 'Yahoo Settings'
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 93
      Height = 13
      Caption = 'Archive Messages :'
    end
    object Label2: TLabel
      Left = 104
      Top = 24
      Width = 57
      Height = 13
      AutoSize = False
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Enable'
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 152
    Top = 352
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = Button1Click
  end
end
