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
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button_cancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_add_flatClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit_db;

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

procedure TForm2.Button_add_flatClick(Sender: TObject);
var sel_str:string;
s_street:string;
begin
  if (self.Edit_street.Text <> '') and (self.Edit_house.Text <> '') and (self.Edit_flat.Text <> '') then
  begin
          s_street := trim(self.Edit_street.Text);
          s_street := s_street.ToLower;
          s_street[1] := upcase(s_street[1]);
         sel_str := 'insert into flat ( '+
                    'street, '+
                    'house_num, '+
                    'flat_num '+
                    ') values ( '+
                    char(39)+s_street+char(39)+', '+
                    char(39)+trim(self.Edit_house.Text)+char(39)+', '+
                    char(39)+trim(self.Edit_flat.Text)+char(39)+')';

         DataModule_prosoft.FDConnection.ExecSQL(sel_str);
         off_edit(self);
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

procedure TForm2.FormActivate(Sender: TObject);
begin
      Self.DBEdit_spr_flat.DataField := 'id';

      self.DBGrid_flat_spr.Columns.Items[0].Width:=0;

end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      off_edit(self);
end;

procedure TForm2.N1Click(Sender: TObject);
begin
       on_edit(self);
end;

end.
