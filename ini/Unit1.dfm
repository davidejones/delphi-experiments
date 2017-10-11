object Form1: TForm1
  Left = 192
  Top = 110
  Width = 696
  Height = 480
  Caption = 'INI Files'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Write Ini File'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Read Ini File'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Read All Sections'
    TabOrder = 2
    OnClick = Button3Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 40
    Width = 345
    Height = 265
    ItemHeight = 13
    TabOrder = 3
  end
  object Button4: TButton
    Left = 272
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Read A Section'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 16
    Top = 312
    Width = 121
    Height = 25
    Caption = 'Read A Section Value'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 144
    Top = 312
    Width = 97
    Height = 25
    Caption = 'Erase A Section'
    TabOrder = 6
    OnClick = Button6Click
  end
end
