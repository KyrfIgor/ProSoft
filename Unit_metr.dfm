object Form_metr: TForm_metr
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1057#1095#1077#1090#1095#1080#1082#1080
  ClientHeight = 360
  ClientWidth = 732
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
    732
    360)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 137
    Top = 19
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label3: TLabel
    Left = 40
    Top = 46
    Width = 128
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1087#1086#1074#1077#1088#1082#1080
  end
  object Label4: TLabel
    Left = 34
    Top = 73
    Width = 134
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1086#1074#1077#1088#1082#1080
  end
  object Edit_metr_num: TEdit
    Left = 174
    Top = 16
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object Edit_mter_date_ver: TEdit
    Left = 174
    Top = 43
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object Edit_metr_date_next_ver: TEdit
    Left = 174
    Top = 70
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object DBGrid_metr_spr: TDBGrid
    Left = 8
    Top = 128
    Width = 716
    Height = 223
    Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1095#1077#1090#1095#1080#1082' - '#1055#1088#1072#1074#1072#1103' '#1082#1085#1086#1087#1082#1072' '#1084#1099#1096#1080
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource_metr_spr
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    PopupMenu = PopupMenu_metr_spr
    ShowHint = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button_add_flat: TButton
    Left = 261
    Top = 97
    Width = 122
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1095#1077#1090#1095#1080#1082
    TabOrder = 4
    Visible = False
    OnClick = Button_add_flatClick
  end
  object DBEdit_metr_spr: TDBEdit
    Left = 536
    Top = 18
    Width = 121
    Height = 21
    DataSource = DataSource_metr_spr
    TabOrder = 5
    Visible = False
  end
  object Button_cancel: TButton
    Left = 174
    Top = 97
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    Visible = False
    OnClick = Button_cancelClick
  end
  object DataSource_metr_spr: TDataSource
    DataSet = DataModule_prosoft.FDQuery_spr_metr
    Left = 48
    Top = 232
  end
  object PopupMenu_metr_spr: TPopupMenu
    Left = 520
    Top = 224
    object N1: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1089#1095#1077#1090#1095#1080#1082
      OnClick = N1Click
    end
  end
end
