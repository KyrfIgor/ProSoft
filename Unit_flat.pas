unit Unit_flat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus, Vcl.Mask, Vcl.DBCtrls;

type
  TForm2 = class(TForm)
    Edit_street: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit_house: TEdit;
    Edit_flat: TEdit;
    DBGrid_flat_spr: TDBGrid;
    DataSource_flat_spr: TDataSource;
    PopupMenu_str_flat: TPopupMenu;
    N1: TMenuItem;
    Button_add_flat: TButton;
    DBEdit_spr_flat: TDBEdit;
    Button_cancel: TButton;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button_cancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_add_flatClick(Sender: TObject);
    procedure Edit_streetChange(Sender: TObject);
    procedure Edit_houseChange(Sender: TObject);
    procedure Edit_flatChange(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit_db, prosoft, my_function, Unit_replace_metr;

procedure on_edit(self: TForm2);
begin
      self.DBGrid_flat_spr.Visible := false;
      self.Button_add_flat.Visible := true;
      self.Button_cancel.Visible := true;
end;

procedure off_edit(self: TForm2);
begin
      self.DBGrid_flat_spr.Visible := true;
      self.Button_add_flat.Visible := false;
      self.Button_cancel.Visible := false;
end;


procedure local_change(self: TForm2);
var
str_start:string;
str_end:string;
begin
    str_start := 'select '+
                  'f.id, '+
                  'f.street as "Улица", '+
                  'f.house_num as "Дом", '+
                  'f.flat_num as "Квартира", '+
                  'em.factory_number as "Счетчик" '+
                  'from flat f '+
                  'left join electric_meter em on em.flat = f.id ';
    str_end := 'order by f.street ';

    on_change(self, DataModule_prosoft.FDQuery_spr_flat, str_start, str_end, 'where');
end;


procedure TForm2.Button_add_flatClick(Sender: TObject);
var sel_str:string;
begin
  if (self.Edit_street.Text <> '') and (self.Edit_house.Text <> '') and (self.Edit_flat.Text <> '') then
  begin
        try
               sel_str := 'insert into flat ( '+
                          'street, '+
                          'house_num, '+
                          'flat_num '+
                          ') values ( '+
                          char(39)+trim(self.Edit_street.Text)+char(39)+', '+
                          char(39)+trim(self.Edit_house.Text)+char(39)+', '+
                          char(39)+trim(self.Edit_flat.Text)+char(39)+')';

               DataModule_prosoft.FDConnection.ExecSQL(sel_str);
               off_edit(self);
               Application.MessageBox('Квартира успешно добавлена', 'Успех',
                 MB_OK + MB_ICONINFORMATION);

               local_change(self);
        except
               Application.MessageBox('Квартира не добавлена. Ошибка.',
                 'Ошибка', MB_OK + MB_ICONSTOP);

        end;

  end
  else
  begin
        Application.MessageBox(PChar('есть пустые поля'), 'Caption', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TForm2.Button_cancelClick(Sender: TObject);
begin
      off_edit(self);
end;

procedure TForm2.Edit_flatChange(Sender: TObject);
begin
      local_change(self);
end;

procedure TForm2.Edit_houseChange(Sender: TObject);
begin
      local_change(self);
end;

procedure TForm2.Edit_streetChange(Sender: TObject);
begin
       local_change(self);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
      local_change(self);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      off_edit(self);
end;

procedure TForm2.N1Click(Sender: TObject);
begin
       on_edit(self);
end;

procedure TForm2.N2Click(Sender: TObject);
begin

       if DataModule_prosoft.FDQuery_spr_flat.FieldByName('Счетчик').IsNull then
       begin
           Form_replace_metr.ShowModal;
           local_change(self);
       end
       else
       begin
          Application.MessageBox('Счетчик уже установлен', 'Предупреждение',
            MB_OK + MB_ICONWARNING);

       end;



end;

procedure TForm2.N3Click(Sender: TObject);
begin
       if DataModule_prosoft.FDQuery_spr_flat.FieldByName('Счетчик').IsNull then
       begin
            Application.MessageBox('Сначала установите счетчик', 'Предупреждение',
            MB_OK + MB_ICONWARNING);
       end
       else
       begin
           Form_replace_metr.ShowModal;
           local_change(self);
       end;
end;

end.
