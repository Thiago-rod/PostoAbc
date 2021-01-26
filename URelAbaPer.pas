unit URelAbaPer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormRelAbaPer = class(TForm)
    BoxFiltro: TGroupBox;
    LabelInicio: TLabel;
    LabelFim: TLabel;
    DataIni: TDateTimePicker;
    DataFim: TDateTimePicker;
    BotaoVisualizar: TButton;
    procedure BotaoVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelAbaPer: TFormRelAbaPer;

implementation

uses UPrincipal ,URelForRepAbaPer;

{$R *.dfm}

procedure TFormRelAbaPer.BotaoVisualizarClick(Sender: TObject);
begin
  try
    FormFRrelatorio := TFormFRrelatorio.Create(nil);
    FormFRrelatorio.DatInicio := (FormatDateTime('yyyy-mm-dd',DataIni.Date));
    FormFRrelatorio.DatFim    := (FormatDateTime('yyyy-mm-dd',DataFim.Date));
    FormFRrelatorio.Show;
  finally
    FreeAndNil(FormFRrelatorio);
  end;
end;

end.
