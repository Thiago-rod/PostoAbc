program ProjetoAbc;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FormPrincipal},
  URegAba in 'URegAba.pas' {FormRegAba},
  URelAbaPer in 'URelAbaPer.pas' {FormRelAbaPer},
  URelForRepAbaPer in 'URelForRepAbaPer.pas' {FormFRrelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormRegAba, FormRegAba);
  Application.CreateForm(TFormRelAbaPer, FormRelAbaPer);
  Application.Run;
end.
