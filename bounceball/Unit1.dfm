object Form1: TForm1
  Left = 204
  Top = 117
  Width = 424
  Height = 496
  Caption = 'Bouncing Ball'
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
  object box: TShape
    Left = 8
    Top = 8
    Width = 401
    Height = 401
  end
  object ball: TShape
    Left = 136
    Top = 224
    Width = 17
    Height = 17
    Brush.Color = clRed
    Shape = stCircle
  end
  object Button1: TButton
    Left = 168
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 8
    Top = 416
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 40
    Top = 416
  end
  object Timer3: TTimer
    Interval = 0
    OnTimer = Timer3Timer
    Left = 72
    Top = 416
  end
end
