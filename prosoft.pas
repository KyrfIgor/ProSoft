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
    Edit_enter_val: TEdit;
    Button_enter: TButton;
    Button_cancel: TButton;
    FDQuery_for_sel: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Edit_streetChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
 //   procedure Edit2Change(Sender: TObject);
    procedure Edit_houseChange(Sender: TObject);
    procedure Edit_flatChange(Sender: TObject);
    procedure DBEdit_flatChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit_metrChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Button_cancelClick(Sender: TObject);
    procedure Button_enterClick(Sender: TObject);
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

uses Unit_db, Unit_flat, my_function, Unit_metr;

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



procedure TForm1.Button_cancelClick(Sender: TObject);
begin
     self.Edit_enter_val.Visible := false;
     self.Button_enter.Visible := false;
     self.Button_cancel.Visible := false;

     self.DBGrid_flat.Enabled := true;
     self.Edit_street.Enabled := true;
     self.Edit_house.Enabled := true;
     self.Edit_flat.Enabled := true;
     self.Edit_metr.Enabled := true;
     self.DBGrid_metr.Enabled := true;
end;

procedure TForm1.Button_enterClick(Sender: TObject);
var
sel_str:string;
max_value:currency;
input_value:currency;
str_date:string;
str_value:string;
begin
     self.Edit_enter_val.Visible := false;
     self.Button_enter.Visible := false;
     self.Button_cancel.Visible := false;

     self.DBGrid_flat.Enabled := true;
     self.Edit_street.Enabled := true;
     self.Edit_house.Enabled := true;
     self.Edit_flat.Enabled := true;
     self.Edit_metr.Enabled := true;
     self.DBGrid_metr.Enabled := true;

     sel_str := 'select '+
                'max(mr.value) as "maxval" '+
                'from meter_readings mr '+
                'where mr.electric_meter = ' + self.DBEdit_metr.Text;

          self.FDQuery_for_sel.SQL.Text := sel_str;
          self.FDQuery_for_sel.Active := True;

      max_value := self.FDQuery_for_sel.FieldByName('maxval').AsCurrency;
      if self.Edit_enter_val.Text <> '' then
      begin
           //if trystrtoint self.Edit_enter_val.Text.

             try
                input_value := StrToCurr(self.Edit_enter_val.Text);
                if max_value > input_value then
                begin
                    ShowMessage('значение должно быть больше предыдущего');
                end
                else
                begin
                    str_date := stringreplace(DateToStr(Date), '/', '.',[rfReplaceAll, rfIgnoreCase]);
                    str_value := stringreplace(Currtostr(input_value), ',', '.',[rfReplaceAll, rfIgnoreCase]);
                    sel_str := 'INSERT INTO meter_readings '+
                                '(electric_meter, date_deposition, value) '+
                                'VALUES('+self.DBEdit_metr.Text+', '+#39+str_date+#39+', '+str_value+')';

                     DataModule_prosoft.FDConnection.ExecSQL(sel_str);
                     local_change(self);
                end;

              except
                on Exception : EConvertError do
                  ShowMessage('Должно быть введено число');
              end;
      end;



end;

procedure TForm1.DBEdit_flatChange(Sender: TObject);
var
sel_str:string;
begin
     if self.DBEdit_flat.text = '' then  exit;
     sel_str := 'select em.factory_number as "Номер", '+
                'em.date_last_ver as "Дата посл. пр", '+
                'em.Date_next_ver as "Дата сл. пр"'+
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
       if self.DBEdit_metr.text = '' then  exit;

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
var
inipath:string;
begin
        inipath := extractfilepath(application.ExeName);
      DataModule_prosoft.FDConnection.Params.Database := inipath+ 'prosoft_db';
      DataModule_prosoft.FDConnection.connected := true;
      local_change(self);

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

procedure TForm1.N5Click(Sender: TObject);
begin
     self.Edit_enter_val.Visible := true;
     self.Button_enter.Visible := true;
     self.Button_cancel.Visible := true;

     self.DBGrid_flat.Enabled := false;
     self.Edit_street.Enabled := false;
     self.Edit_house.Enabled := false;
     self.Edit_flat.Enabled := false;
     self.Edit_metr.Enabled := false;
     self.DBGrid_metr.Enabled := false;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
     form_metr.ShowModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
      form2.ShowModal;
end;

end.
