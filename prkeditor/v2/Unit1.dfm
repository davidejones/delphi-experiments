object Form1: TForm1
  Left = 193
  Top = 119
  BorderStyle = bsSingle
  Caption = 'Park Editor'
  ClientHeight = 552
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 481
    Height = 81
    Caption = 'Park Information'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 78
      Height = 13
      Caption = 'File Location     :'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 77
      Height = 13
      Caption = 'Park Name       :'
    end
    object Label3: TLabel
      Left = 88
      Top = 24
      Width = 377
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label4: TLabel
      Left = 88
      Top = 40
      Width = 312
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 8
      Top = 56
      Width = 79
      Height = 13
      Caption = 'Park Size (Hex) :'
    end
    object Label16: TLabel
      Left = 88
      Top = 56
      Width = 305
      Height = 13
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 400
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Load Park'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 176
    Width = 481
    Height = 369
    Caption = 'Park Objects'
    TabOrder = 1
    object Label9: TLabel
      Left = 8
      Top = 24
      Width = 136
      Height = 13
      Caption = 'Offset (bytes from start of file)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ListBox1: TListBox
      Left = 8
      Top = 40
      Width = 185
      Height = 313
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object GroupBox3: TGroupBox
      Left = 216
      Top = 24
      Width = 241
      Height = 329
      Caption = 'Object Editing'
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 80
        Width = 54
        Height = 13
        Caption = 'Object ID : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 128
        Width = 38
        Height = 13
        Caption = 'X Axis : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 240
        Width = 84
        Height = 13
        Caption = 'Height/Direction :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label8: TLabel
        Left = 8
        Top = 32
        Width = 35
        Height = 13
        Caption = 'Index : '
      end
      object Label10: TLabel
        Left = 168
        Top = 8
        Width = 34
        Height = 13
        Caption = 'Offset :'
      end
      object Label11: TLabel
        Left = 208
        Top = 8
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label12: TLabel
        Left = 8
        Top = 184
        Width = 35
        Height = 13
        Caption = 'Y Axis :'
      end
      object Edit1: TEdit
        Left = 96
        Top = 72
        Width = 129
        Height = 21
        MaxLength = 2
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 96
        Top = 120
        Width = 129
        Height = 21
        MaxLength = 2
        TabOrder = 1
        OnKeyPress = Edit2KeyPress
      end
      object Edit3: TEdit
        Left = 96
        Top = 232
        Width = 129
        Height = 21
        MaxLength = 4
        TabOrder = 2
        OnKeyPress = Edit3KeyPress
      end
      object Button2: TButton
        Left = 80
        Top = 296
        Width = 81
        Height = 25
        Caption = 'Apply Changes'
        Enabled = False
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 160
        Top = 296
        Width = 73
        Height = 25
        Caption = 'Add New'
        Enabled = False
        TabOrder = 4
        Visible = False
        OnClick = Button3Click
      end
      object Edit4: TEdit
        Left = 96
        Top = 24
        Width = 33
        Height = 21
        TabOrder = 5
      end
      object Edit5: TEdit
        Left = 96
        Top = 176
        Width = 129
        Height = 21
        MaxLength = 2
        TabOrder = 6
        OnKeyPress = Edit5KeyPress
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 96
    Width = 481
    Height = 73
    Caption = 'Change Park Size'
    TabOrder = 2
    object Label13: TLabel
      Left = 8
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Width :'
    end
    object Label14: TLabel
      Left = 8
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Length :'
    end
    object Label17: TLabel
      Left = 200
      Top = 16
      Width = 75
      Height = 13
      Caption = 'Common Sizes :'
      Visible = False
    end
    object Label18: TLabel
      Left = 200
      Top = 32
      Width = 144
      Height = 13
      Caption = '0000, 0000, 0000, 0000, 0000'
      Visible = False
    end
    object Edit6: TEdit
      Left = 48
      Top = 16
      Width = 121
      Height = 21
      MaxLength = 2
      TabOrder = 0
      OnKeyPress = Edit6KeyPress
    end
    object Edit7: TEdit
      Left = 48
      Top = 40
      Width = 121
      Height = 21
      MaxLength = 2
      TabOrder = 1
      OnKeyPress = Edit7KeyPress
    end
    object Button4: TButton
      Left = 400
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Apply'
      Enabled = False
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 472
    object File1: TMenuItem
      Caption = 'File'
      object LoadPark1: TMenuItem
        Caption = 'Load Park'
        OnClick = LoadPark1Click
      end
      object Createabackup1: TMenuItem
        Caption = 'Create a backup'
        OnClick = Createabackup1Click
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object About1: TMenuItem
      Caption = 'Help'
      OnClick = About1Click
      object About2: TMenuItem
        Caption = 'About'
        OnClick = About2Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Thug2 Parks|*.prk'
    Left = 472
    Top = 24
  end
end
