object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1050#1074#1072#1088#1090#1080#1088#1099
  ClientHeight = 367
  ClientWidth = 1071
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    1071
    367)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 52
    Top = 21
    Width = 31
    Height = 13
    Caption = #1059#1083#1080#1094#1072
  end
  object Label3: TLabel
    Left = 24
    Top = 47
    Width = 59
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1084#1072
  end
  object Label4: TLabel
    Left = 34
    Top = 73
    Width = 49
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1080#1088#1072
  end
  object Label1: TLabel
    Left = 671
    Top = 109
    Width = 136
    Height = 13
    Caption = #1046#1091#1088#1085#1072#1083' '#1079#1072#1084#1077#1085#1099' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
  end
  object Label7: TLabel
    Left = 89
    Top = 2
    Width = 167
    Height = 13
    Caption = #1053#1072#1095#1085#1080#1090#1077' '#1074#1074#1086#1076' '#1074' '#1087#1086#1083#1103' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
  end
  object Edit_street: TEdit
    Left = 89
    Top = 18
    Width = 209
    Height = 21
    TabOrder = 0
    OnChange = Edit_streetChange
  end
  object Edit_house: TEdit
    Left = 89
    Top = 44
    Width = 209
    Height = 21
    TabOrder = 1
    OnChange = Edit_houseChange
  end
  object Edit_flat: TEdit
    Left = 89
    Top = 70
    Width = 209
    Height = 21
    TabOrder = 2
    OnChange = Edit_flatChange
  end
  object DBGrid_flat_spr: TDBGrid
    Left = 8
    Top = 128
    Width = 657
    Height = 223
    Hint = 
      #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1082#1074#1072#1088#1090#1080#1088#1091', '#1091#1089#1090#1072#1085#1086#1074#1082#1072' '#1080' '#1079#1072#1084#1077#1085#1072' '#1089#1095#1077#1090#1095#1080#1082#1072' - '#1055#1088#1072#1074#1072#1103' '#1082#1085#1086 +
      #1087#1082#1072' '#1084#1099#1096#1080
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource_flat_spr
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    PopupMenu = PopupMenu_str_flat
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button_add_flat: TButton
    Left = 176
    Top = 97
    Width = 122
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1074#1072#1088#1090#1080#1088#1091
    TabOrder = 4
    Visible = False
    OnClick = Button_add_flatClick
  end
  object DBEdit_spr_flat: TDBEdit
    Left = 320
    Top = 18
    Width = 121
    Height = 21
    DataSource = DataSource_flat_spr
    TabOrder = 5
    OnChange = DBEdit_spr_flatChange
  end
  object Button_cancel: TButton
    Left = 89
    Top = 97
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    Visible = False
    OnClick = Button_cancelClick
  end
  object DBGrid1: TDBGrid
    Left = 671
    Top = 128
    Width = 392
    Height = 223
    DataSource = DataSource_jornal
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource_flat_spr: TDataSource
    DataSet = DataModule_prosoft.FDQuery_spr_flat
    Left = 48
    Top = 232
  end
  object PopupMenu_str_flat: TPopupMenu
    Left = 520
    Top = 224
    object N1: TMenuItem
      Caption = #1053#1086#1074#1072#1103' '#1082#1074#1072#1088#1090#1080#1088#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1095#1077#1090#1095#1080#1082
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1072' '#1089#1095#1077#1090#1095#1080#1082#1072
      OnClick = N3Click
    end
  end
  object DataSource_jornal: TDataSource
    DataSet = DataModule_prosoft.FDQuery_jornal
    Left = 816
    Top = 208
  end
end
