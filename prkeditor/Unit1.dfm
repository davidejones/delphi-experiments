object Form1: TForm1
  Left = 192
  Top = 114
  Width = 264
  Height = 420
  Caption = 'Park Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 144
    Width = 45
    Height = 13
    Caption = 'Object ID'
  end
  object Label2: TLabel
    Left = 24
    Top = 176
    Width = 41
    Height = 13
    Caption = 'X/Y Axis'
  end
  object Label3: TLabel
    Left = 24
    Top = 208
    Width = 29
    Height = 13
    Caption = 'Y Axis'
  end
  object Label4: TLabel
    Left = 24
    Top = 240
    Width = 74
    Height = 13
    Caption = 'height/direction'
  end
  object Label5: TLabel
    Left = 16
    Top = 88
    Width = 146
    Height = 26
    Caption = '(offset from beggining in bytes) Start writing from this offset'
    WordWrap = True
  end
  object Label6: TLabel
    Left = 48
    Top = 56
    Width = 59
    Height = 13
    Caption = 'Park Name :'
  end
  object Label7: TLabel
    Left = 120
    Top = 56
    Width = 24
    Height = 13
    Caption = 'none'
  end
  object Label8: TLabel
    Left = 192
    Top = 368
    Width = 53
    Height = 13
    Caption = 'Version 1.1'
  end
  object Button1: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Load File'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '162'
  end
  object Edit2: TEdit
    Left = 112
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '13484'
  end
  object Edit3: TEdit
    Left = 112
    Top = 200
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 112
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '64'
  end
  object Button2: TButton
    Left = 136
    Top = 328
    Width = 89
    Height = 25
    Caption = 'apply from offset'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Edit5: TEdit
    Left = 168
    Top = 88
    Width = 57
    Height = 21
    TabOrder = 6
    Text = '3545'
  end
  object Button3: TButton
    Left = 24
    Top = 288
    Width = 91
    Height = 65
    Caption = 'Find first entry of an object and apply'
    TabOrder = 7
    WordWrap = True
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 136
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 8
    Visible = False
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 8
  end
end
