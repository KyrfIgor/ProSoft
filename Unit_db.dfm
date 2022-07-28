object DataModule_prosoft: TDataModule_prosoft
  OldCreateOrder = False
  Height = 446
  Width = 638
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=E:\[proj]\ProSoft\prosoft_db')
    Left = 48
    Top = 24
  end
  object FDManager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 438
    Top = 16
  end
  object FDQuery_flat: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select '
      'em.id,'
      'em.flat,'
      'f.street as "'#1059#1083#1080#1094#1072'",'
      'f.house_num as "'#1044#1086#1084'",'
      'f.flat_num as "'#1050#1074#1072#1088#1090#1080#1088#1072'",'
      'max(mr.value) as valmet'
      'from electric_meter em '
      'join meter_readings mr on mr.electric_meter = em.id'
      'join flat f on f.id = em.flat '
      'WHERE '
      'enable  = 1'
      'GROUP by em.flat'
      'order by f.street')
    Left = 64
    Top = 168
  end
  object FDQuery_spr_flat: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select'
      'f.id,'
      'f.street as "'#1059#1083#1080#1094#1072'",'
      'f.house_num as "'#1044#1086#1084'",'
      'f.flat_num as "'#1050#1074#1072#1088#1090#1080#1088#1072'"'
      'from flat f'
      'order by f.street')
    Left = 200
    Top = 168
  end
  object FDQuery_flat_metr: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select em.factory_number, '
      'em.date_last_ver, '
      'em.Date_next_ver  '
      'from electric_meter em '
      'where em.flat = 3')
    Left = 64
    Top = 224
  end
  object FDQuery_flat_value: TFDQuery
    Connection = FDConnection
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    Left = 64
    Top = 280
  end
  object FDQuery_spr_metr: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select '
      'id,'
      'factory_number as "'#1053#1086#1084#1077#1088'",'
      'date_last_ver as "'#1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1088#1082#1080'",'
      'Date_next_ver as "'#1044#1072#1090#1072' '#1089#1083'. '#1087#1088#1086#1074'.",'
      'flat as "'#1050#1086#1076' '#1050#1074#1072#1088#1090#1080#1088#1099'"'
      'FROM electric_meter em ')
    Left = 296
    Top = 168
  end
  object FDQuery_replace_metr: TFDQuery
    Connection = FDConnection
    Left = 400
    Top = 168
  end
  object FDQuery_jornal: TFDQuery
    Connection = FDConnection
    Left = 512
    Top = 168
  end
end
