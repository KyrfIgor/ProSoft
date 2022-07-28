unit Unit_metr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Menus, Vcl.Grids, Vcl.DBGrids;

type
  TForm_metr = class(TForm)
    Edit_metr_num: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_mter_date_ver: TEdit;
    Edit_metr_date_next_ver: TEdit;
    DBGrid_metr_spr: TDBGrid;
    DataSource_metr_spr: TDataSource;
    PopupMenu_metr_spr: TPopupMenu;
    N1: TMenuItem;
    Button_add_flat: TButton;
    DBEdit_metr_spr: TDBEdit;
    Button_cancel: TButton;
    procedure N1Click(Sender: TObject);
    procedure Button_cancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_add_flatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_metr: TForm_metr;

implementation

{$R *.dfm}

uses Unit_db;

procedure local_change(self: TForm_metr);
var
sel_str:string;
begin

      sel_str:= 'select '+
                'id, '+
                'factory_number as "Номер", '+
                'date_last_ver as "Дата проверки", '+
                'Date_next_ver as "Дата сл. пров.", '+
                'flat as "Код Квартиры" '+
                'FROM electric_meter em ';
      DataModule_prosoft.FDQuery_spr_metr.Active := False;
      DataModule_prosoft.FDQuery_spr_metr.SQL.Text := sel_str;
      DataModule_prosoft.FDQuery_spr_metr.Active := True;
      Self.DBEdit_metr_spr.DataField := 'id';

      self.DBGrid_metr_spr.Columns.Items[0].Width:=0;
end;


procedure on_edit(self: TForm_metr);
begin
      self.DBGrid_metr_spr.Visible := false;
      self.Button_add_flat.Visible := true;
      self.Button_cancel.Visible := true;
      //self.Edit_mter_date_ver.Visible := false;
      //self.Edit_metr_date_next_ver.Visible := false;
end;

procedure off_edit(self: TForm_metr);
begin
      self.DBGrid_metr_spr.Visible := true;
      self.Button_add_flat.Visible := false;
      self.Button_cancel.Visible := false;
      //self.Edit_mter_date_ver.Visible := true;
      //self.Edit_metr_date_next_ver.Visible := true;
end;



procedure TForm_metr.Button_add_flatClick(Sender: TObject);
var sel_str:string;
date_ver:string;
date_next:string;
begin
  if (self.Edit_metr_num.Text <> '') and (self.Edit_mter_date_ver.Text <> '') and (self.Edit_metr_date_next_ver.Text <> '') then
  begin
      try
         date_ver := stringreplace(self.Edit_mter_date_ver.Text, '/', '.',[rfReplaceAll, rfIgnoreCase]);
         date_next := stringreplace(self.Edit_metr_date_next_ver.Text, '/', '.',[rfReplaceAll, rfIgnoreCase]);
         sel_str := 'insert into electric_meter ( '+
                    'factory_number, '+
                    'date_last_ver, '+
                    'Date_next_ver, '+
                    'flat, '+
                    'enable, '+
                    'date_install '+
                    ') values ( '+
                    char(39)+trim(self.Edit_metr_num.Text)+char(39)+
                     ', '+#39+date_ver+#39+', '+#39+date_next+#39+', 0, 0, "")';
         DataModule_prosoft.FDConnection.ExecSQL(sel_str);
         off_edit(self);
         Application.MessageBox('Счетчик успешно добавлен', 'Успех', MB_OK +
           MB_ICONINFORMATION);

         local_change(self);
      except
          Application.MessageBox('Счетчик не добавлен', 'Ошибка', MB_OK +
            MB_ICONSTOP);

      end;

  end
  else
  begin
        Application.MessageBox('Есть пустые поля', 'Внимание!', MB_OK +
          MB_ICONWARNING);

  end;
end;


procedure TForm_metr.Button_cancelClick(Sender: TObject);
begin
        off_edit(self);
end;

procedure TForm_metr.FormActivate(Sender: TObject);
begin
  local_change(self);
end;

procedure TForm_metr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       off_edit(self);
end;

procedure TForm_metr.N1Click(Sender: TObject);
begin
       on_edit(self);
end;

end.
