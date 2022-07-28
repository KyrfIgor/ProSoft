object Form_replace_metr: TForm_replace_metr
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072', '#1079#1072#1084#1077#1085#1072' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
  ClientHeight = 186
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 114
    Height = 13
    Caption = #1057#1095#1077#1090#1095#1080#1082#1080' '#1082' '#1091#1089#1090#1072#1085#1086#1074#1082#1077
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 27
    Width = 320
    Height = 120
    DataSource = DataSource_replace_metr
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 251
    Top = 153
    Width = 75
    Height = 25
    Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource_replace_metr: TDataSource
    DataSet = DataModule_prosoft.FDQuery_replace_metr
    Left = 256
    Top = 40
  end
end
