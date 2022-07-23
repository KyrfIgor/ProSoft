program Project_prosoft;

uses
  Vcl.Forms,
  prosoft in 'prosoft.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
