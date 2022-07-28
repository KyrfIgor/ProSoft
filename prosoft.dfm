object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ProSoft'
  ClientHeight = 406
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
    Top = 30
    Width = 31
    Height = 13
    Caption = #1059#1083#1080#1094#1072
  end
  object Label3: TLabel
    Left = 24
    Top = 56
    Width = 59
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1084#1072
  end
  object Label4: TLabel
    Left = 34
    Top = 82
    Width = 49
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
  end
  object Label1: TLabel
    Left = 8
    Top = 109
    Width = 75
    Height = 13
    Caption = #1053#1086#1084'. '#1057#1095#1077#1090#1095#1080#1082#1072
  end
  object Label5: TLabel
    Left = 304
    Top = 11
    Width = 187
    Height = 13
    Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1081' '#1089#1095#1077#1090#1095#1080#1082'  '#1074' '#1082#1074#1072#1088#1090#1080#1088#1091
  end
  object Label6: TLabel
    Left = 537
    Top = 117
    Width = 104
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1072
  end
  object Label7: TLabel
    Left = 89
    Top = 11
    Width = 167
    Height = 13
    Caption = #1053#1072#1095#1085#1080#1090#1077' '#1074#1074#1086#1076' '#1074' '#1087#1086#1083#1103' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
  end
  object Label8: TLabel
    Left = 8
    Top = 388
    Width = 356
    Height = 13
    Caption = #1054#1088#1072#1085#1078#1077#1074#1099#1084' '#1094#1074#1077#1090#1086#1084' '#1086#1090#1084#1077#1095#1077#1085#1099' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1075#1076#1077' '#1085#1091#1078#1085#1086' '#1087#1086#1074#1077#1088#1080#1090#1100' '#1089#1095#1077#1090#1095#1080#1082
  end
  object DBGrid_value: TDBGrid
    Left = 537
    Top = 136
    Width = 220
    Height = 248
    Hint = #1042#1074#1086#1076' '#1087#1086#1082#1072#1079#1072#1085#1080#1081' '#1089#1095#1077#1090#1095#1080#1082#1072' - '#1087#1088#1072#1074#1072#1103' '#1082#1085#1086#1087#1082#1072' '#1084#1099#1096#1080
    DataSource = DataSource_flat_value
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    PopupMenu = PopupMenu_flat
    ShowHint = True
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid_flat: TDBGrid
    Left = 8
    Top = 136
    Width = 523
    Height = 248
    DataSource = DataSource_flat
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid_flatDrawColumnCell
  end
  object Edit_street: TEdit
    Left = 89
    Top = 27
    Width = 209
    Height = 21
    TabOrder = 1
    OnChange = Edit_streetChange
  end
  object Edit_house: TEdit
    Left = 89
    Top = 53
    Width = 209
    Height = 21
    TabOrder = 2
    OnChange = Edit_houseChange
  end
  object Edit_flat: TEdit
    Left = 89
    Top = 79
    Width = 209
    Height = 21
    TabOrder = 3
    OnChange = Edit_flatChange
  end
  object Edit_metr: TEdit
    Left = 89
    Top = 106
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
    Visible = False
    OnChange = DBEdit_metrChange
  end
  object DBEdit_flat: TDBEdit
    Left = 416
    Top = 203
    Width = 65
    Height = 21
    DataSource = DataSource_flat
    TabOrder = 6
    Visible = False
    OnChange = DBEdit_flatChange
  end
  object DBGrid_metr: TDBGrid
    Left = 304
    Top = 27
    Width = 453
    Height = 73
    DataSource = DataSource_flat_metr
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit_enter_val: TEdit
    Left = 645
    Top = 114
    Width = 112
    Height = 21
    TabOrder = 8
    Visible = False
  end
  object Button_enter: TButton
    Left = 645
    Top = 136
    Width = 111
    Height = 25
    Caption = #1042#1074#1086#1076' '#1087#1086#1082#1072#1079#1072#1085#1080#1081
    TabOrder = 9
    Visible = False
    OnClick = Button_enterClick
  end
  object Button_cancel: TButton
    Left = 566
    Top = 136
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 10
    Visible = False
    OnClick = Button_cancelClick
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 8
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N7: TMenuItem
        Caption = #1050#1074#1072#1088#1090#1080#1088#1099
        OnClick = N7Click
      end
      object N6: TMenuItem
        Caption = #1057#1095#1077#1090#1095#1080#1082#1080
        OnClick = N6Click
      end
    end
  end
  object PopupMenu_flat: TPopupMenu
    Left = 568
    Top = 296
    object N5: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1072
      OnClick = N5Click
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
  object FDQuery_for_sel: TFDQuery
    Connection = DataModule_prosoft.FDConnection
    Left = 696
    Top = 24
  end
end
