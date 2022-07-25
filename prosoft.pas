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
    Edit1: TEdit;
    Edit2: TEdit;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    Edit3: TEdit;
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
    procedure FormActivate(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit_db, Unit_flat;

procedure TForm1.FormActivate(Sender: TObject);
begin
      Self.DBEdit_metr.DataField := 'id';
      Self.DBEdit_flat.DataField := 'flat';

      self.DBGrid_flat.Columns.Items[0].Width:=0;
      self.DBGrid_flat.Columns.Items[1].Width:=0;




end;

procedure TForm1.N7Click(Sender: TObject);
begin
      form2.ShowModal;
end;

end.
