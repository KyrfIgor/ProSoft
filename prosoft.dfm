object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'ProSoft'
  ClientHeight = 452
  ClientWidth = 757
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 184
    Width = 741
    Height = 120
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object FDManager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 656
    Top = 16
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=E:\[proj]\ProSoft\prosoft_db')
    Connected = True
    Left = 24
    Top = 24
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select '
      'flat.street,'
      'flat.house_num,'
      'flat.flat_num,'
      'factory_number,'
      'date_last_ver,'
      'Date_next_ver '
      'from electric_meter em'
      'join flat on em.flat  = flat.id ')
    Left = 96
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 160
    Top = 24
  end
end
