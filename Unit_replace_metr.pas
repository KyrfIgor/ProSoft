unit Unit_replace_metr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TForm_replace_metr = class(TForm)
    DataSource_replace_metr: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_replace_metr: TForm_replace_metr;

implementation

{$R *.dfm}

uses Unit_db;

procedure TForm_replace_metr.Button1Click(Sender: TObject);
var
metr:integer;
flat:integer;
sel_str:string;
str_date:string;
begin
       metr := DataModule_prosoft.FDQuery_replace_metr.FieldByName('id').Value ;
       flat := DataModule_prosoft.FDQuery_spr_flat.FieldByName('id').Value;
       str_date := stringreplace(DateToStr(Date), '/', '.',[rfReplaceAll, rfIgnoreCase]);
       if DataModule_prosoft.FDQuery_spr_flat.FieldByName('Счетчик').IsNull then
       begin
           //установка
           try
               sel_str := 'UPDATE electric_meter '+
                          'SET  flat='+inttostr(flat)+', enable=1, date_install='+#39+str_date+#39+' '+
                          'WHERE id='+inttostr(metr);
               DataModule_prosoft.FDConnection.ExecSQL(sel_str);
           
               sel_str := 'INSERT INTO meter_readings '+
                          '(electric_meter, date_deposition, value) '+
                          'VALUES('+inttostr(metr)+', '+#39+str_date+#39+', 0); ';
               DataModule_prosoft.FDConnection.ExecSQL(sel_str);

               Application.MessageBox('Счетчик был успешно установлен',
                 'Успех', MB_OK + MB_ICONINFORMATION);


           except    
                Application.MessageBox('Ошибка!' +
                  #13#10 + 'Попробуйте снова', 'Счетчик не установлен', MB_OK
                  + MB_ICONSTOP);


           end;
           close;
       end
       else
       begin
           //замена
           try
                 sel_str := 'INSERT INTO jornal '+
                            '(flat, metr, date_change) '+
                            'VALUES('+inttostr(flat)+', '+inttostr(metr)+', '+#39+str_date+#39+')';

                 DataModule_prosoft.FDConnection.ExecSQL(sel_str);

                 sel_str := 'UPDATE electric_meter '+
                          'SET  flat='+inttostr(flat)+', enable=1, date_install='+#39+str_date+#39+' '+
                          'WHERE id='+inttostr(metr);

                 DataModule_prosoft.FDConnection.ExecSQL(sel_str);

                Application.MessageBox('Счетчик был успешно заменен',
                 'Успех', MB_OK + MB_ICONINFORMATION);
           except
                Application.MessageBox('Ошибка!' +
                  #13#10 + 'Попробуйте снова', 'Счетчик не заменен', MB_OK
                  + MB_ICONSTOP);
           end;
       end;
end;

procedure TForm_replace_metr.FormShow(Sender: TObject);
var
sel_str:string;
begin
     sel_str := 'select '+
                'id, '+
                'factory_number as "Номер счетчика" '+
                'FROM '+
                'electric_meter em '+
                'where flat = 0 ';

          DataModule_prosoft.FDQuery_replace_metr.Active := False;
          DataModule_prosoft.FDQuery_replace_metr.SQL.Text := sel_str;
          DataModule_prosoft.FDQuery_replace_metr.Active := True;

          self.DBGrid1.Columns.Items[0].Width:=0;
end;

end.
