program Project_prosoft;

uses
  Vcl.Forms,
  prosoft in 'prosoft.pas' {Form1},
  Unit_flat in 'Unit_flat.pas' {Form2},
  Unit_db in 'Unit_db.pas' {DataModule_prosoft: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDataModule_prosoft, DataModule_prosoft);
  Application.Run;
end.
