object Form1: TForm1
  Left = 192
  Top = 110
  Width = 466
  Height = 421
  Caption = 'Bounce Ball'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 441
    Height = 369
    TabOrder = 0
    object ball: TShape
      Left = 120
      Top = 112
      Width = 25
      Height = 25
      Shape = stCircle
    end
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 16
    Top = 344
  end
end
