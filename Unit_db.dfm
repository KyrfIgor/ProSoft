object DataModule_prosoft: TDataModule_prosoft
  OldCreateOrder = False
  Height = 332
  Width = 486
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=E:\[proj]\ProSoft\prosoft_db')
    Connected = True
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
    Active = True
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
    Left = 152
    Top = 96
  end
  object FDQuery_spr_flat: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select'
      'f.id,'
      'f.street as "'#1059#1083#1080#1094#1072'",'
      'f.house_num as "'#1044#1086#1084'",'
      'f.flat_num as "'#1050#1074#1072#1088#1090#1080#1088#1072'"'
      'from flat f'
      'order by f.street')
    Left = 152
    Top = 160
  end
end
