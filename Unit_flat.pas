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
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label7: TLabel;
    DataSource_jornal: TDataSource;
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
    procedure DBEdit_spr_flatChange(Sender: TObject);

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
                  'f.street as "�����", '+
                  'f.house_num as "���", '+
                  'f.flat_num as "��������", '+
                  'em.factory_number as "�������" '+
                  'from flat f '+
                  'left join electric_meter em on em.flat = f.id ';
    str_end := 'order by f.street ';

    on_change(self, DataModule_prosoft.FDQuery_spr_flat, str_start, str_end, 'where');

    Self.DBEdit_spr_flat.DataField := 'id';
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
               Application.MessageBox('�������� ������� ���������', '�����',
                 MB_OK + MB_ICONINFORMATION);

               local_change(self);
        except
               Application.MessageBox('�������� �� ���������. ������.',
                 '������', MB_OK + MB_ICONSTOP);

        end;

  end
  else
  begin
        Application.MessageBox(PChar('���� ������ ����'), 'Caption', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TForm2.Button_cancelClick(Sender: TObject);
begin
      off_edit(self);
end;

procedure TForm2.DBEdit_spr_flatChange(Sender: TObject);
var
sel_str:string;
flat:string;
begin

      if GLOBAL_END  then
      begin
                if Self.DBEdit_spr_flat.Text = '' then
                begin
                     flat := '0';
                end
                else
                begin
                     flat := Self.DBEdit_spr_flat.Text;
                end;

                sel_str := 'select '+
                            'date_change as "���� ������", '+
                            'em.factory_number as "��. �������", '+
                            'em2.factory_number as "���. �������" '+
                            'from jornal j '+
                            'join electric_meter em on em.id = j.metr_old '+
                            'join electric_meter em2 on em2.id = j.metr '+
                            'where j.flat = '+flat;

                DataModule_prosoft.FDQuery_jornal.Active := false;
                DataModule_prosoft.FDQuery_jornal.SQL.Text :=  sel_str;
                DataModule_prosoft.FDQuery_jornal.Active := true;

                self.DBGrid1.Columns.Items[1].Width:=140;
                self.DBGrid1.Columns.Items[2].Width:=140;
      end;

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
var
row_sel:Integer;
begin

       if DataModule_prosoft.FDQuery_spr_flat.FieldByName('�������').IsNull then
       begin
           Form_replace_metr.ShowModal;
           row_sel := DataModule_prosoft.FDQuery_spr_flat.RecNo;
           local_change(self);
           DataModule_prosoft.FDQuery_spr_flat.RecNo := row_sel;

       end
       else
       begin
          Application.MessageBox('������� ��� ����������', '��������������',
            MB_OK + MB_ICONWARNING);

       end;



end;

procedure TForm2.N3Click(Sender: TObject);
var
row_sel:Integer;
begin
       if DataModule_prosoft.FDQuery_spr_flat.FieldByName('�������').IsNull then
       begin
            Application.MessageBox('������� ���������� �������', '��������������',
            MB_OK + MB_ICONWARNING);
       end
       else
       begin
           Form_replace_metr.ShowModal;
           row_sel := DataModule_prosoft.FDQuery_spr_flat.RecNo;
           local_change(self);
           DataModule_prosoft.FDQuery_spr_flat.RecNo := row_sel;
       end;
end;

end.
