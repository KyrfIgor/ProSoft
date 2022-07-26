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


procedure on_edit(self: TForm_metr);
begin
      self.DBGrid_metr_spr.Visible := false;
      self.Button_add_flat.Visible := true;
      self.Button_cancel.Visible := true;
      self.Edit_mter_date_ver.Visible := false;
      self.Edit_metr_date_next_ver.Visible := false;
end;

procedure off_edit(self: TForm_metr);
begin
      self.DBGrid_metr_spr.Visible := true;
      self.Button_add_flat.Visible := false;
      self.Button_cancel.Visible := false;
      self.Edit_mter_date_ver.Visible := true;
      self.Edit_metr_date_next_ver.Visible := true;
end;



procedure TForm_metr.Button_add_flatClick(Sender: TObject);
var sel_str:string;
begin
  if (self.Edit_metr_num.Text <> '')  then
  begin

         sel_str := 'insert into electric_meter ( '+
                    'factory_number, '+
                    'date_last_ver, '+
                    'Date_next_ver, '+
                    'flat, '+
                    'enable, '+
                    'date_install '+
                    ') values ( '+
                    char(39)+trim(self.Edit_metr_num.Text)+char(39)+
                     ', "", "", 0, 0, "")';
         DataModule_prosoft.FDConnection.ExecSQL(sel_str);
         off_edit(self);
  end
  else
  begin
        Application.MessageBox(PChar('есть пустые поля'), 'Caption', MB_OK + MB_ICONINFORMATION);
  end;
end;


procedure TForm_metr.Button_cancelClick(Sender: TObject);
begin
        off_edit(self);
end;

procedure TForm_metr.FormActivate(Sender: TObject);
begin
      Self.DBEdit_metr_spr.DataField := 'id';

      self.DBGrid_metr_spr.Columns.Items[0].Width:=0;
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
