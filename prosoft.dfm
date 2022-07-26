object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'ProSoft'
  ClientHeight = 464
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 52
    Top = 11
    Width = 31
    Height = 13
    Caption = #1059#1083#1080#1094#1072
  end
  object Label3: TLabel
    Left = 24
    Top = 37
    Width = 59
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1084#1072
  end
  object Label4: TLabel
    Left = 34
    Top = 63
    Width = 49
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
  end
  object Label1: TLabel
    Left = 8
    Top = 90
    Width = 75
    Height = 13
    Caption = #1053#1086#1084'. '#1057#1095#1077#1090#1095#1080#1082#1072
  end
  object Label5: TLabel
    Left = 353
    Top = 8
    Width = 124
    Height = 13
    Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1081' '#1089#1095#1077#1090#1095#1080#1082
  end
  object Label6: TLabel
    Left = 537
    Top = 117
    Width = 104
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1072
  end
  object DBGrid_flat: TDBGrid
    Left = 8
    Top = 136
    Width = 523
    Height = 248
    DataSource = DataSource_flat
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu_flat
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit_street: TEdit
    Left = 89
    Top = 8
    Width = 209
    Height = 21
    TabOrder = 1
    OnChange = Edit_streetChange
  end
  object Edit_house: TEdit
    Left = 89
    Top = 34
    Width = 209
    Height = 21
    TabOrder = 2
    OnChange = Edit_houseChange
  end
  object Edit_flat: TEdit
    Left = 89
    Top = 60
    Width = 209
    Height = 21
    TabOrder = 3
    OnChange = Edit_flatChange
  end
  object Edit_metr: TEdit
    Left = 89
    Top = 87
    Width = 209
    Height = 21
    TabOrder = 4
  end
  object DBEdit_metr: TDBEdit
    Left = 416
    Top = 184
    Width = 65
    Height = 21
    DataSource = DataSource_flat
    TabOrder = 5
    OnChange = DBEdit_metrChange
  end
  object DBEdit_flat: TDBEdit
    Left = 416
    Top = 203
    Width = 65
    Height = 21
    DataSource = DataSource_flat
    TabOrder = 6
    OnChange = DBEdit_flatChange
  end
  object DBGrid_metr: TDBGrid
    Left = 353
    Top = 27
    Width = 312
    Height = 84
    DataSource = DataSource_flat_metr
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid_value: TDBGrid
    Left = 537
    Top = 136
    Width = 219
    Height = 248
    DataSource = DataSource_flat_value
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object MainMenu: TMainMenu
    Left = 8
    Top = 8
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N7: TMenuItem
        Caption = #1050#1074#1072#1088#1090#1080#1088#1099
        OnClick = N7Click
      end
      object N6: TMenuItem
        Caption = #1057#1095#1077#1090#1095#1080#1082#1080
      end
    end
  end
  object PopupMenu_flat: TPopupMenu
    Left = 232
    Top = 312
    object N3: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1095#1077#1090#1095#1080#1082' '#1074' '#1082#1074#1072#1088#1090#1080#1088#1091
    end
    object N4: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1089#1095#1077#1090#1095#1080#1082#1072
    end
    object N5: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1072
    end
  end
  object DataSource_flat: TDataSource
    DataSet = DataModule_prosoft.FDQuery_flat
    Left = 320
    Top = 312
  end
  object DataSource_flat_metr: TDataSource
    DataSet = DataModule_prosoft.FDQuery_flat_metr
    Left = 480
    Top = 32
  end
  object DataSource_flat_value: TDataSource
    DataSet = DataModule_prosoft.FDQuery_flat_value
    Left = 496
    Top = 104
  end
end
