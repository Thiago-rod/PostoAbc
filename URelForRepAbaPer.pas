unit URelForRepAbaPer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormFRrelatorio = class(TForm)
    RLReportRelatorio: TRLReport;
    BandaTopo: TRLBand;
    LabelEmpresa: TRLLabel;
    LabelPagina: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    LabelData: TRLLabel;
    LabelHora: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    BandaCabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    BandaDetalhe: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    BandaFooter: TRLBand;
    ConexaoSql: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    BandaAcumulado: TRLBand;
    LabelValorAcu: TRLLabel;
    RLLabel9: TRLLabel;
    FDQuery2: TFDQuery;
    LabelLitrosAcu: TRLLabel;
    LabelImpoAcu: TRLLabel;
    RLLabel10: TRLLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BandaAcumuladoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    FDatInicio : String;
    FDatFim    : String;
    FFonte     : TFont;
    WValAcuLit : Double;
    WValAcuVen : Currency;
    WValAcuImp : Currency;
  public
    { Public declarations }
    property DatInicio : String read FDatInicio write FDatInicio;
    property DatFim : String read FDatFim write FDatFim;
    property Fonte: TFont read FFonte write FFonte;
  end;

var
  FormFRrelatorio: TFormFRrelatorio;

implementation

  uses UPrincipal;

{$R *.dfm}

procedure TFormFRrelatorio.BandaAcumuladoBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FDQuery2.Close;
  FDQuery2.Open( ' Select                            '+
                 ' Sum(Qtd_Litros) as SomaLitros,    '+
                 ' Sum(Valor_Venda) as SomaVenda,    '+
                 ' Sum(Imposto_Venda) as SomaImposto '+
                 ' From Abastecimento                '+
                 ' Where                             '+
                 ' Data_Abastecimento between '+ QuotedStr(FDatInicio) +' and '+ QuotedStr(FDatFim));


  WValAcuLit := FDQuery2.FieldByName('SomaLitros').AsFloat;
  WValAcuVen := FDQuery2.FieldByName('SomaVenda').AsFloat;
  WValAcuImp := FDQuery2.FieldByName('SomaImposto').AsFloat;


  LabelLitrosAcu.Caption := FormatFloat('#0.00',WValAcuLit);
  LabelValorAcu.Caption := FormatFloat('#0.00',WValAcuVen);
  LabelImpoAcu.Caption := FormatFloat('#0.00',WValAcuImp);
end;

procedure TFormFRrelatorio.FormCreate(Sender: TObject);
begin
  ConexaoSql.Params.Clear;
  //ConexaoSql.Params.Add('Database=D:\Projetos\Posto ABC\Banco de dados\Banco_Posto.sdb');
  ConexaoSql.Params.Add('Database='+DirBD);
  ConexaoSql.Params.Add('Server=LocalHost');
  ConexaoSql.Params.Add('User_Name=');
  ConexaoSql.Params.Add('Password=');
  ConexaoSql.Params.Add('DriverID=SQLite');
  ConexaoSql.Params.Add('FetchAll=True');
  ConexaoSql.Connected := True;

  Fonte := TFont.Create;
  Fonte.Name := 'Courier New';
  Fonte.Size := 10;
  FFonte.Size := 7;
end;

procedure TFormFRrelatorio.FormShow(Sender: TObject);
begin
   FDQuery1.Close;
   FDQuery1.Open(' Select               ' +
                 ' Cod_Abastecimento,   ' +
                 ' Data_Abastecimento,  ' +
                 ' Cod_Tanque,          ' +
                 ' Nome_Combustivel,    ' +
                 ' Cod_Bomba,           ' +
                 ' Qtd_Litros,          ' +
                 ' Valor_Venda,         ' +
                 ' Imposto_Venda        ' +
                 ' From Abastecimento   ' +
                 ' Where                ' +
                 ' Data_Abastecimento between '+ QuotedStr(FDatInicio) +' and '+ QuotedStr(FDatFim) +
                 ' Order by Cod_Abastecimento');



  RLReportRelatorio.PreviewModal;
end;

end.
