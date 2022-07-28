unit Unit_db;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  Data.DB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule_prosoft = class(TDataModule)
    FDConnection: TFDConnection;
    FDManager: TFDManager;
    FDQuery_flat: TFDQuery;
    FDQuery_spr_flat: TFDQuery;
    FDQuery_flat_metr: TFDQuery;
    FDQuery_flat_value: TFDQuery;
    FDQuery_spr_metr: TFDQuery;
    FDQuery_replace_metr: TFDQuery;
    FDQuery_jornal: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule_prosoft: TDataModule_prosoft;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
