object Form2: TForm2
  Left = 269
  Top = 229
  BorderStyle = bsToolWindow
  Caption = 'Progress..'
  ClientHeight = 102
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 8
    Top = 40
    Width = 241
    Height = 25
    Color = clBtnFace
    ForeColor = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Progress = 0
  end
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 85
    Height = 13
    Caption = 'Loading File List...'
  end
end
