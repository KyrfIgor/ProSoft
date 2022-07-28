unit my_function;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus, Vcl.Mask, Vcl.DBCtrls;


procedure on_change(my_form: TForm; MY_FDQuery: TFDQuery; str_start:string; str_end:string; having:string);

implementation

uses Unit_flat, Unit_db;

//процедура обновлени€ запроса
//принимает на вход форму, компонент запрос к базе, начальна€ строка запроса, конечна€ строка запроса, критерий
procedure on_change(my_form: TForm; MY_FDQuery: TFDQuery; str_start:string; str_end:string; having:string);
var
sel_str:string;
num_component:integer;
str_and:string;
begin

      str_and := having;

      sel_str := str_start;
      if (my_form.FindComponent('Edit_street') as TEdit).Text <> '' then
      begin
          sel_str := sel_str + str_and+ ' f.street like '+#39+'%'+(my_form.FindComponent('Edit_street') as TEdit).Text+'%'+#39+' ' ;
          str_and := ' AND ';
      end;
      if (my_form.FindComponent('Edit_house') as TEdit).Text <> '' then
      begin
          sel_str := sel_str + str_and + ' f.house_num like '+#39+'%'+(my_form.FindComponent('Edit_house') as TEdit).Text+'%'+#39+' ';
          str_and := ' AND ';
      end;
      if (my_form.FindComponent('Edit_flat') as TEdit).Text <> '' then
      begin
          sel_str := sel_str + str_and + ' f.flat_num like '+#39+'%'+(my_form.FindComponent('Edit_flat') as TEdit).Text+'%'+#39+' ';
      end;

      sel_str := sel_str + str_end;

      MY_FDQuery.Active := False;
      MY_FDQuery.SQL.Text := sel_str;
      MY_FDQuery.Active := True;
end;





end.
