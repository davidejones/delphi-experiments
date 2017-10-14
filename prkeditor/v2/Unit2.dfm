object Form2: TForm2
  Left = 300
  Top = 289
  Width = 300
  Height = 250
  Caption = 'Add A Park Object'
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 281
    Height = 201
    Caption = 'Add Park Object'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 51
      Height = 13
      Caption = 'Object ID :'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 35
      Height = 13
      Caption = 'X Axis :'
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 35
      Height = 13
      Caption = 'Y Axis :'
    end
    object Label4: TLabel
      Left = 8
      Top = 128
      Width = 84
      Height = 13
      Caption = 'Height/Direction :'
    end
    object Label5: TLabel
      Left = 8
      Top = 152
      Width = 177
      Height = 26
      Caption = 
        'This isn'#39't ready yet! it wont add a new object only overwrite on' +
        'e'
      WordWrap = True
    end
    object Edit1: TEdit
      Left = 112
      Top = 56
      Width = 161
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 112
      Top = 88
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 112
      Top = 120
      Width = 161
      Height = 21
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 112
      Top = 24
      Width = 161
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'A2')
    end
    object Button2: TButton
      Left = 192
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
end
