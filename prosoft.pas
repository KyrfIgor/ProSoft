unit prosoft;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, Vcl.StdCtrls,
  Vcl.Menus, Vcl.Mask, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    DBGrid_flat: TDBGrid;
    Edit_street: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_house: TEdit;
    Edit_flat: TEdit;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    Edit_metr: TEdit;
    Label1: TLabel;
    PopupMenu_flat: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    DataSource_flat: TDataSource;
    DBEdit_metr: TDBEdit;
    DBEdit_flat: TDBEdit;
    DataSource_flat_metr: TDataSource;
    DataSource_flat_value: TDataSource;
    Label5: TLabel;
    DBGrid_metr: TDBGrid;
    Label6: TLabel;
    DBGrid_value: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Edit_streetChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit_houseChange(Sender: TObject);
    procedure Edit_flatChange(Sender: TObject);
    procedure DBEdit_flatChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit_metrChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  GLOBAL_END:bool;

implementation

{$R *.dfm}

uses Unit_db, Unit_flat, my_function;

procedure local_change(self: TForm1);
var
str_start:string;
str_end:string;
begin
     str_start := 'select '+
                  'em.id, '+
                  'em.flat, '+
                  'f.street as "Улица", '+
                  'f.house_num as "Дом", '+
                  'f.flat_num as "Квартира", '+
                  'max(mr.value) as valmet '+
                  'from electric_meter em '+
                  'join meter_readings mr on mr.electric_meter = em.id '+
                  'join flat f on f.id = em.flat '+
                  'WHERE '+
                  'enable  = 1 '+
                  'GROUP by em.flat ';

     str_end :=  'order by f.street';

      on_change(self, DataModule_prosoft.FDQuery_flat, str_start, str_end, 'having');
      self.DBGrid_flat.Columns.Items[0].Width:=0;
      self.DBGrid_flat.Columns.Items[1].Width:=0;
end;



procedure TForm1.DBEdit_flatChange(Sender: TObject);
var
sel_str:string;
begin
     sel_str := 'select em.factory_number as "Номер", '+
                'em.date_last_ver as "Дата посл.", '+
                'em.Date_next_ver as "Дата сл."'+
                'from electric_meter em '+
                'where em.flat = ' + self.DBEdit_flat.Text;


     if GLOBAL_END then
     begin
          DataModule_prosoft.FDQuery_flat_metr.Active := False;
          DataModule_prosoft.FDQuery_flat_metr.SQL.Text := sel_str;
          DataModule_prosoft.FDQuery_flat_metr.Active := True;
     end;
     self.DBGrid_metr.Columns.Items[0].Width:=100;
end;

procedure TForm1.DBEdit_metrChange(Sender: TObject);
var
sel_str:string;
begin
       sel_str := 'select '+
                  'mr.date_deposition as "Дата", '+
                  'mr.value as "Показание" '+
                  'from meter_readings mr '+
                  'where mr.electric_meter = '+ self.DBEdit_metr.Text +
                  ' order by mr.date_deposition';
     if GLOBAL_END then
     begin
          DataModule_prosoft.FDQuery_flat_value.Active := False;
          DataModule_prosoft.FDQuery_flat_value.SQL.Text := sel_str;
          DataModule_prosoft.FDQuery_flat_value.Active := True;
     end;

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
     local_change(self);
end;

procedure TForm1.Edit2Change(Sender: TObject);
var
str_start:string;
str_end:string;
begin
     str_start := 'select '+
                  'em.id, '+
                  'em.flat, '+
                  'f.street as "Улица", '+
                  'f.house_num as "Дом", '+
                  'f.flat_num as "Квартира", '+
                  'max(mr.value) as valmet '+
                  'from electric_meter em '+
                  'join meter_readings mr on mr.electric_meter = em.id '+
                  'join flat f on f.id = em.flat '+
                  'WHERE '+
                  'enable  = 1 '+
                  'GROUP by em.flat ';

     str_end :=  'order by f.street';

      on_change(self, DataModule_prosoft.FDQuery_flat, str_start, str_end, 'having');

      self.DBGrid_flat.Columns.Items[0].Width:=0;
      self.DBGrid_flat.Columns.Items[1].Width:=0;
end;

procedure TForm1.Edit_flatChange(Sender: TObject);
begin
     local_change(self);
end;

procedure TForm1.Edit_houseChange(Sender: TObject);
begin
      local_change(self);
end;

procedure TForm1.Edit_streetChange(Sender: TObject);
begin
      local_change(self);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
      Self.DBEdit_metr.DataField := 'id';
      Self.DBEdit_flat.DataField := 'flat';

      self.DBGrid_flat.Columns.Items[0].Width:=0;
      self.DBGrid_flat.Columns.Items[1].Width:=0;

      self.DBGrid_metr.Columns.Items[0].Width:=100;


end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     GLOBAL_END := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
      GLOBAL_END := true;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
      form2.ShowModal;
end;

end.
