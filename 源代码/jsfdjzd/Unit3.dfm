object MainForm1: TMainForm1
  Left = 523
  Top = 420
  Width = 1105
  Height = 544
  Caption = #22823#23398#29983#31454#36187#21457#24067#21450#32452#38431#31995#32479
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 841
    Height = 120
    DataSource = DataSourcejs
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 552
    Top = 120
    Width = 289
    Height = 241
    Caption = #21019#24314#38431#20237#65288#20316#20026#38431#38271#65289
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 57
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = #38431#20237#21517#31216'   '
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 8
      Top = 80
      Width = 57
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = #21442#21152#31454#36187'   '
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 57
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = #25351#23548#32769#24072'   '
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object Editdwmc: TEdit
      Left = 80
      Top = 32
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object ComboBox1: TComboBox
      Left = 80
      Top = 80
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
    end
    object ComboBox2: TComboBox
      Left = 80
      Top = 128
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
    end
    object Button1: TButton
      Left = 88
      Top = 176
      Width = 75
      Height = 25
      Caption = #21019#24314
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 120
    Width = 545
    Height = 120
    DataSource = DataSourcezdls
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 240
    Width = 545
    Height = 120
    DataSource = DataSourcedw
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object GroupBox2: TGroupBox
    Left = -8
    Top = 376
    Width = 297
    Height = 121
    Caption = #30003#35831#21152#20837#38431#20237#65288#20316#20026#38431#21592#65289
    TabOrder = 4
    object Label4: TLabel
      Left = 64
      Top = 40
      Width = 39
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = #38431#20237'     '
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object ComboBox3: TComboBox
      Left = 120
      Top = 32
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object Button2: TButton
      Left = 112
      Top = 80
      Width = 75
      Height = 25
      Caption = #25552#20132#30003#35831
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 296
    Top = 376
    Width = 289
    Height = 121
    Caption = #22788#29702#20837#38431#30003#35831#65288#20316#20026#38431#38271#65289
    TabOrder = 5
    object Label5: TLabel
      Left = 56
      Top = 40
      Width = 42
      Height = 13
      Caption = #30003#35831#20154'  '
      Layout = tlCenter
    end
    object ComboBox4: TComboBox
      Left = 128
      Top = 32
      Width = 105
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object Button3: TButton
      Left = 64
      Top = 80
      Width = 65
      Height = 25
      Caption = #21516#24847
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 160
      Top = 80
      Width = 65
      Height = 25
      Caption = #25298#32477
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 600
    Top = 376
    Width = 225
    Height = 121
    Caption = #38431#20237#29366#24577
    ItemIndex = 0
    Items.Strings = (
      #32452#38431#20013
      #23457#26680#36890#36807)
    TabOrder = 6
  end
  object GroupBox4: TGroupBox
    Left = 840
    Top = 24
    Width = 225
    Height = 473
    Caption = #26597#30475#38431#20237#32452#25104
    TabOrder = 7
    object ComboBox5: TComboBox
      Left = 32
      Top = 48
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object DBGrid4: TDBGrid
      Left = 16
      Top = 160
      Width = 185
      Height = 273
      DataSource = DataSourcedwgc
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object Button5: TButton
      Left = 64
      Top = 96
      Width = 75
      Height = 25
      Caption = #26597#30475
      TabOrder = 2
      OnClick = Button5Click
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 672
    Top = 16
  end
  object ADODataSetjs: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 528
    Top = 16
  end
  object DataSourcejs: TDataSource
    DataSet = ADODataSetjs
    Left = 528
    Top = 56
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 672
    Top = 56
  end
  object ADODataSetzdls: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 576
    Top = 16
  end
  object DataSourcezdls: TDataSource
    DataSet = ADODataSetzdls
    Left = 576
    Top = 56
  end
  object ADODataSetdw: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 624
    Top = 16
  end
  object DataSourcedw: TDataSource
    DataSet = ADODataSetdw
    Left = 624
    Top = 56
  end
  object DataSourcedwgc: TDataSource
    DataSet = ADODataSetdwgc
    Left = 728
    Top = 56
  end
  object ADODataSetdwgc: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 728
    Top = 16
  end
end
