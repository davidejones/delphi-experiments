object Form1: TForm1
  Left = 227
  Top = 149
  Width = 441
  Height = 560
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 417
    Height = 481
  end
  object Button1: TButton
    Left = 8
    Top = 496
    Width = 75
    Height = 25
    Caption = 'Change Color'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 88
    Top = 496
    Width = 337
    Height = 21
    TabOrder = 1
    Text = 'Hex Color'
    OnKeyPress = Edit1KeyPress
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen]
  end
end
