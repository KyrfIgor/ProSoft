unit m_function;

interface

uses
  SysUtils, Math,  Grids,
  Classes, Forms, DB, DateUtils,
  Windows, Messages, Variants, Graphics, Controls, Dialogs, StdCtrls, IdFTP,
   StrUtils, ComCtrls,  Mask, Menus, IdBaseComponent,
  IdTCPConnection, IdTCPClient, ExtCtrls,
   Tabs,
  DBCtrls, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  IdHashMessageDigest, ActiveX;




function db_insert(my_form: TForm; my_zqury: TFDQuery; tbl_name: string; my_code: string = ''): Integer;

implementation







function db_insert(my_form: TForm; my_zqury: TFDQuery; tbl_name: string; my_code: string = ''): Integer;
var
  sel_str: string;
  sel_zpt: string;
  sel_zpt_arg: string;
  sel_str_type: string;
  sel_str_ver: string;
  sel_str_ver_zpt: string;
  i: Integer;
  comp_name: string;
  field_name: string;
  len_find: Integer;
  T2: string;
  nnn: Integer;

 // my_TDBEditEh:TDBEditEh;
  my_TsEdit: TEdit;
  my_TsRichEdit: TRichEdit;
  my_TsCheckBox: TCheckBox;
  AComponent: TComponent;
begin

  sel_str := 'select ' + 'a.attname, ' + 'd.description, ' + 'pg_catalog.format_type(a.atttypid, a.atttypmod) ' + 'from ' + 'pg_description d, ' + 'pg_attribute a, ' + 'pg_class c ' + 'where d.objoid=a.attrelid and d.objsubid=a.attnum and c.oid=d.objoid and c.relname = ' + #39 + tbl_name + #39;
  IR_DB_FireDac_query(my_zqury, sel_str);

  if tbl_name = 'userpwd' then
  begin
    sel_str_ver := 'SELECT s_user FROM ' + tbl_name + ' WHERE ';
  end;

  if tbl_name = 'usergrp' then
  begin
    sel_str_ver := 'SELECT s_grp FROM ' + tbl_name + ' WHERE ';
  end;

  if (tbl_name <> 'userpwd') and (tbl_name <> 'usergrp') then
  begin
    sel_str_ver := 'SELECT code FROM ' + tbl_name + ' WHERE ';
  end;

  sel_str := 'INSERT INTO ' + 'public.' + tbl_name + '(';

  sel_zpt := '';
  sel_str_ver_zpt := '';
  sel_zpt_arg := '';

  for i := 0 to my_form.ComponentCount - 1 do
  begin

    comp_name := '';
             // if my_form.Components[i] is TDBEditEh then  comp_name := (my_form.Components[i] as TDBEditEh).Name;
    if my_form.Components[i] is TsEdit then
      comp_name := (my_form.Components[i] as TsEdit).Name;
    if my_form.Components[i] is TsRichEdit then
      comp_name := (my_form.Components[i] as TsRichEdit).Name;
    if my_form.Components[i] is TsCheckBox then
      comp_name := (my_form.Components[i] as TsCheckBox).Name;
    if my_form.Components[i] is TsMaskEdit then
      comp_name := (my_form.Components[i] as TsMaskEdit).Name;
    if my_form.Components[i] is TsDateEdit then
      comp_name := (my_form.Components[i] as TsDateEdit).Name;

    if (AnsiContainsText(comp_name, 'ixx_TTT_' + tbl_name + '_FFF_')) or (AnsiContainsText(comp_name, 'sui_TTT_' + tbl_name + '_FFF_')) or (AnsiContainsText(comp_name, 'uix_TTT_' + tbl_name + '_FFF_')) or (AnsiContainsText(comp_name, 'six_TTT_' + tbl_name + '_FFF_')) then
    begin

      field_name := IR_DBAUTO_get_comp_name(comp_name);

      if (my_code <> '') or (field_name <> 'code') then
      begin

        sel_str := sel_str + sel_zpt + field_name;
        sel_zpt := ', ';
      end;

    end;
  end;

  sel_str := sel_str + ') VALUES( ';

  for i := 0 to my_form.ComponentCount - 1 do
  begin
    comp_name := '';
             // if my_form.Components[i] is TDBEditEh then  comp_name := (my_form.Components[i] as TDBEditEh).Name;
    if my_form.Components[i] is TsEdit then
      comp_name := (my_form.Components[i] as TsEdit).Name;
    if my_form.Components[i] is TsRichEdit then
      comp_name := (my_form.Components[i] as TsRichEdit).Name;
    if my_form.Components[i] is TsCheckBox then
      comp_name := (my_form.Components[i] as TsCheckBox).Name;
    if my_form.Components[i] is TsMaskEdit then
      comp_name := (my_form.Components[i] as TsMaskEdit).Name;
    if my_form.Components[i] is TsDateEdit then
      comp_name := (my_form.Components[i] as TsDateEdit).Name;

    if (AnsiContainsText(comp_name, 'ixx_TTT_' + tbl_name + '_FFF_')) or (AnsiContainsText(comp_name, 'sui_TTT_' + tbl_name + '_FFF_')) or (AnsiContainsText(comp_name, 'uix_TTT_' + tbl_name + '_FFF_')) or (AnsiContainsText(comp_name, 'six_TTT_' + tbl_name + '_FFF_')) then
    begin

      field_name := IR_DBAUTO_get_comp_name(comp_name);

      my_zqury.First;
      if field_name <> 'code' then
      begin
          while my_zqury.Eof = false do
          begin

            if my_zqury.FieldByName('attname').Value = field_name then
            begin
              T2 := my_zqury.FieldByName('format_type').Value;
              if AnsiContainsText(T2, 'smallint') or AnsiContainsText(T2, 'integer') or AnsiContainsText(T2, 'numeric') then
              begin
                if (my_form.Components[i] as TsEdit).Text <> '' then
                begin
                  sel_str_ver := sel_str_ver + sel_str_ver_zpt + my_zqury.FieldByName('attname').Value + ' = ';
                  sel_str_ver_zpt := ' AND ';
                end;
              end;
              if AnsiContainsText(T2, 'character varying') or AnsiContainsText(T2, 'text') then
              begin
                sel_str_ver := sel_str_ver + sel_str_ver_zpt + my_zqury.FieldByName('attname').Value + ' = ';
                sel_str_ver_zpt := ' AND ';
              end;
              if AnsiContainsText(T2, 'date') then
              begin
                sel_str_ver := sel_str_ver + sel_str_ver_zpt + my_zqury.FieldByName('attname').Value + ' = ';
                sel_str_ver_zpt := ' AND ';
              end;
              if AnsiContainsText(T2, 'time') or AnsiContainsText(T2, 'time(0) without time zone') then
              begin
                sel_str_ver := sel_str_ver + sel_str_ver_zpt + my_zqury.FieldByName('attname').Value + ' = ';
                sel_str_ver_zpt := ' AND ';
              end;


            end;

            my_zqury.Next;
          end;
      end;

      if (my_code <> '') or (field_name <> 'code') then
      begin
        if my_form.Components[i] is TsEdit then
        begin

          if AnsiContainsText(T2, 'smallint') or AnsiContainsText(T2, 'integer') or AnsiContainsText(T2, 'numeric') then
          begin

            if (my_form.Components[i] as TsEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + (my_form.Components[i] as TsEdit).Text;

            end
            else
            begin
              sel_str := sel_str + sel_zpt_arg + 'NULL';
            end;
            sel_zpt_arg := ', ';
            sel_str_ver := sel_str_ver + (my_form.Components[i] as TsEdit).Text;

          end;
          if AnsiContainsText(T2, 'character varying') or AnsiContainsText(T2, 'text') then
          begin
            sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsEdit).Text + #39;
            sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsEdit).Text + #39;

            sel_zpt_arg := ', ';
          end;
          if AnsiContainsText(T2, 'date') then
          begin
            if (my_form.Components[i] as TsEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsEdit).text + #39;
              sel_zpt_arg := ', ';
              sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsEdit).text + #39;

            end
            else
            begin

            end;
          end;
          if AnsiContainsText(T2, 'time') or AnsiContainsText(T2, 'time(0) without time zone') then
          begin

            if (my_form.Components[i] as TsEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsEdit).Text + #39;
              sel_zpt_arg := ', ';
              sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsEdit).Text + #39;

            end
            else
            begin
              if (my_form.Components[i] as TsEdit).Text <> '' then
              begin
                sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsEdit).Text + #39;
                sel_zpt_arg := ', ';
                sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsEdit).Text + #39;

              end;

            end;

          end;





          Continue;
        end;

        if (my_form.Components[i] is TsMaskEdit) and not(my_form.Components[i] is TsDateEdit) then
        begin

          if AnsiContainsText(T2, 'smallint') or AnsiContainsText(T2, 'integer') or AnsiContainsText(T2, 'numeric') then
          begin

            if (my_form.Components[i] as TsMaskEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + (my_form.Components[i] as TsMaskEdit).Text;

            end
            else
            begin
              sel_str := sel_str + sel_zpt_arg + 'NULL';
            end;
            sel_zpt_arg := ', ';
            sel_str_ver := sel_str_ver + (my_form.Components[i] as TsMaskEdit).Text;

          end;
          if AnsiContainsText(T2, 'character varying') or AnsiContainsText(T2, 'text') then
          begin
            sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsMaskEdit).Text + #39;
            sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsMaskEdit).Text + #39;

            sel_zpt_arg := ', ';
          end;
          if AnsiContainsText(T2, 'date') then
          begin
            if (my_form.Components[i] as TsMaskEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsMaskEdit).text + #39;
              sel_zpt_arg := ', ';
              sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsMaskEdit).text + #39;

            end
            else
            begin

            end;
          end;
          if AnsiContainsText(T2, 'time') or AnsiContainsText(T2, 'time(0) without time zone') then
          begin

            if (my_form.Components[i] as TsMaskEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsMaskEdit).Text + #39;
              sel_zpt_arg := ', ';
              sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsMaskEdit).Text + #39;

            end
            else
            begin

            end;
          end;

          Continue;
        end;

        if my_form.Components[i] is TsDateEdit then
        begin

          if AnsiContainsText(T2, 'character varying') or AnsiContainsText(T2, 'text') then
          begin
            sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsDateEdit).Text + #39;
            sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsDateEdit).Text + #39;

            sel_zpt_arg := ', ';
          end;
          if AnsiContainsText(T2, 'date') then
          begin
            if (my_form.Components[i] as TsDateEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsDateEdit).text + #39;
              sel_zpt_arg := ', ';
              sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsDateEdit).text + #39;

            end
          end;
          if (AnsiContainsText(T2, 'timestamp(0) with time zone')) or (AnsiContainsText(T2, 'timestamp with time zone')) then
          begin
            if (my_form.Components[i] as TsDateEdit).Text <> '' then
            begin
              sel_str := sel_str + sel_zpt_arg + #39 + (my_form.Components[i] as TsDateEdit).text + #39;
              sel_zpt_arg := ', ';
              sel_str_ver := sel_str_ver + #39 + (my_form.Components[i] as TsDateEdit).text + #39;

            end
          end;
          Continue;
        end;

        if my_form.Components[i] is TsRichEdit then
        begin

          Continue;
        end;

        if my_form.Components[i] is TsCheckBox then
        begin

          if AnsiContainsText(T2, 'boolean') then
          begin

            if (my_form.Components[i] as TsCheckBox).Checked = true then
              sel_str := sel_str + sel_zpt + ' true';
            if (my_form.Components[i] as TsCheckBox).Checked = false then
              sel_str := sel_str + sel_zpt + ' false';
            sel_zpt := ',';

          end;

          Continue;
        end;

      end;

    end;

  end;

  sel_str := sel_str + ')';
  IR_DB_FireDac_query(my_zqury, sel_str_ver);
  if my_zqury.RecordCount > 0 then
  begin
    case Application.MessageBox('Такая запись уже существует в справочнике.' + #13#10 + 'Продублировать запись?', 'Caption', MB_OKCANCEL + MB_ICONWARNING + MB_DEFBUTTON2) of
      IDOK:
        begin

          my_DM.FDConnection_main.ExecSQL(sel_str);
        end;
      IDCANCEL:
        begin

        end;
    end;

  end
  else
  begin

    my_DM.FDConnection_main.ExecSQL(sel_str);
  end;

end;


end.
