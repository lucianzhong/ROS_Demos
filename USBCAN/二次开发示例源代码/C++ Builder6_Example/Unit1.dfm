object Form1: TForm1
  Left = 400
  Top = 134
  Width = 485
  Height = 510
  Caption = 'USB CAN Demo('#21019#33455#20809#30005#31185#25216#26377#38480#20844#21496')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 449
    Height = 153
    Caption = #35774#22791#21442#25968
    TabOrder = 5
    object Label8: TLabel
      Left = 16
      Top = 24
      Width = 60
      Height = 13
      Caption = #35774#22791#31867#22411#65306
    end
    object Label9: TLabel
      Left = 176
      Top = 24
      Width = 58
      Height = 13
      Caption = 'CAN'#36890#36947#65306
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 48
      Width = 433
      Height = 97
      Caption = #21021#22987#21270'CAN'#21442#25968
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 59
        Height = 13
        Caption = #39564#25910#30721#65306'0x'
      end
      object Label2: TLabel
        Left = 160
        Top = 24
        Width = 59
        Height = 13
        Caption = #23631#34109#30721#65306'0x'
      end
      object Label10: TLabel
        Left = 8
        Top = 64
        Width = 65
        Height = 13
        Caption = #23450#26102#22120'0'#65306'0x'
      end
      object Label11: TLabel
        Left = 154
        Top = 64
        Width = 65
        Height = 13
        Caption = #23450#26102#22120'1'#65306'0x'
      end
      object Label12: TLabel
        Left = 296
        Top = 24
        Width = 60
        Height = 13
        Caption = #28388#27874#26041#24335#65306
      end
      object Label13: TLabel
        Left = 320
        Top = 64
        Width = 36
        Height = 13
        Caption = #27169#24335#65306
      end
      object Edit2: TEdit
        Left = 80
        Top = 20
        Width = 65
        Height = 21
        TabOrder = 0
        Text = '00000000'
      end
      object Edit3: TEdit
        Left = 224
        Top = 20
        Width = 65
        Height = 21
        TabOrder = 1
        Text = 'FFFFFFFF'
      end
      object Edit5: TEdit
        Left = 80
        Top = 60
        Width = 65
        Height = 21
        TabOrder = 2
        Text = '00'
      end
      object Edit6: TEdit
        Left = 224
        Top = 60
        Width = 65
        Height = 21
        TabOrder = 3
        Text = '14'
      end
      object ComboBox3: TComboBox
        Left = 352
        Top = 20
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        Items.Strings = (
          #25509#25910#25152#26377#31867#22411
          #21482#25509#25910#26631#20934#24103
          #21482#25509#25910#25193#23637#24103)
      end
      object ComboBox4: TComboBox
        Left = 352
        Top = 60
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          #27491#24120#27169#24335
          #21482#21548#27169#24335
          #33258#27979#27169#24335)
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 88
    Top = 27
    Width = 83
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnClick = ComboBox1Click
    Items.Strings = (
      'USB_CAN'
      'USB_CAN2')
  end
  object ComboBox2: TComboBox
    Left = 258
    Top = 27
    Width = 73
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnClick = ComboBox2Click
    Items.Strings = (
      #36890#36947'1'
      #36890#36947'2')
  end
  object Button1: TButton
    Left = 347
    Top = 24
    Width = 75
    Height = 25
    Caption = #36830#25509
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 392
    Top = 208
    Width = 75
    Height = 25
    Caption = #22797#20301'CAN'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 392
    Top = 176
    Width = 73
    Height = 25
    Caption = #21551#21160'CAN'
    TabOrder = 4
    OnClick = Button3Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 178
    Width = 377
    Height = 89
    Caption = ' '#21457#36865#25968#25454#24103' '
    TabOrder = 6
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 48
      Height = 13
      Caption = #24103#31867#22411#65306
    end
    object Label5: TLabel
      Left = 136
      Top = 24
      Width = 48
      Height = 13
      Caption = #24103#26684#24335#65306
    end
    object Label6: TLabel
      Left = 264
      Top = 24
      Width = 35
      Height = 13
      Caption = #24103'ID'#65306
    end
    object Label7: TLabel
      Left = 16
      Top = 56
      Width = 36
      Height = 13
      Caption = #25968#25454#65306
    end
    object ComboBox6: TComboBox
      Left = 56
      Top = 20
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        #26631#20934#24103
        #25193#23637#24103)
    end
    object ComboBox7: TComboBox
      Left = 184
      Top = 20
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        #25968#25454#24103
        #36828#31243#24103)
    end
    object Edit1: TEdit
      Left = 304
      Top = 20
      Width = 65
      Height = 21
      TabOrder = 2
      Text = '00000080'
    end
    object Edit4: TEdit
      Left = 56
      Top = 53
      Width = 193
      Height = 21
      TabOrder = 3
      Text = '01 02 03 04 05 06 07 08 '
    end
    object Button4: TButton
      Left = 296
      Top = 51
      Width = 75
      Height = 25
      Caption = #21457#36865
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 280
    Width = 457
    Height = 193
    Caption = #20449#24687
    TabOrder = 7
    object ListBox1: TListBox
      Left = 8
      Top = 16
      Width = 441
      Height = 169
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Button5: TButton
    Left = 392
    Top = 240
    Width = 73
    Height = 25
    Caption = #28165#31354#21015#34920
    TabOrder = 8
    OnClick = Button5Click
  end
end
