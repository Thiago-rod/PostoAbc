unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Relatrio1: TMenuItem;
    RelatriodeVendasporPerodo1: TMenuItem;
    Relatrios1: TMenuItem;
    RelatriodeAbastecimentosporPerodo1: TMenuItem;
    OpenDialog1: TOpenDialog;
    EditDirBd: TEdit;
    Label1: TLabel;
    procedure RelatriodeVendasporPerodo1Click(Sender: TObject);
    procedure RelatriodeAbastecimentosporPerodo1Click(Sender: TObject);
    procedure EditDirBdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;
  DirBD : String;
implementation

uses UregAba, URelAbaPer;

{$R *.dfm}

procedure TFormPrincipal.EditDirBdClick(Sender: TObject);
begin
  if opendialog1.Execute then
   begin
     DirBD := opendialog1.FileName;
     EditDirBd.Text := DirBD;
   end;
end;

procedure TFormPrincipal.RelatriodeAbastecimentosporPerodo1Click(
  Sender: TObject);
begin
  FormRelAbaPer := TFormRelAbaPer.Create(Self);
  try
    FormRelAbaPer.ShowModal;
  finally
    FreeAndNil(FormRelAbaPer);
  end;
end;

procedure TFormPrincipal.RelatriodeVendasporPerodo1Click(Sender: TObject);
begin
  FormRegAba := TFormRegAba.Create(Self);
  try
    FormRegAba.ShowModal;
  finally
    FreeAndNil(FormRegAba);
  end;
end;

end.
