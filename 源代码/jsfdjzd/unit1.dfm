object LoginForm: TLoginForm
  Left = 982
  Top = 194
  Width = 465
  Height = 420
  Caption = #30331#24405' '
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
    Left = 120
    Top = 72
    Width = 42
    Height = 13
    Caption = #29992#25143#21517'  '
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 120
    Top = 120
    Width = 30
    Height = 13
    Caption = #23494#30721'  '
    Layout = tlCenter
  end
  object ButtonLogin: TButton
    Left = 128
    Top = 256
    Width = 75
    Height = 25
    Caption = #30331#24405
    TabOrder = 0
    OnClick = ButtonLoginClick
  end
  object ButtonRegister: TButton
    Left = 264
    Top = 256
    Width = 75
    Height = 25
    Caption = #27880#20876
    TabOrder = 1
    OnClick = ButtonRegisterClick
  end
  object EditName: TEdit
    Left = 224
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object EditPassword: TEdit
    Left = 224
    Top = 120
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object RadioGroup1: TRadioGroup
    Left = 120
    Top = 176
    Width = 233
    Height = 49
    Caption = #30331#24405#35282#33394
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #23398#29983
      #31649#29702#21592)
    TabOrder = 4
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 384
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 384
    Top = 152
  end
end
