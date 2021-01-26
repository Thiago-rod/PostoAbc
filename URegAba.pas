unit URegAba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.ComCtrls;

type
  TFormRegAba = class(TForm)
    BotaoGravar: TButton;
    BotaoLimpar: TButton;
    LabelBomba: TLabel;
    LabelLitros: TLabel;
    LabelValor: TLabel;
    EditBomba: TEdit;
    EditLitros: TEdit;
    EditValor: TEdit;
    LabelData: TLabel;
    LabelTanque: TLabel;
    EditTanque: TEdit;
    ConexaoSql: TFDConnection;
    FDQuery1: TFDQuery;
    LabelCombustivel: TLabel;
    LabelImposto: TLabel;
    BoxNovoAbastecimento: TGroupBox;
    DataSource1: TDataSource;
    EditData: TDateTimePicker;
    procedure BotaoGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BotaoLimparClick(Sender: TObject);
    procedure EditTanqueExit(Sender: TObject);
    procedure EditValorExit(Sender: TObject);
    procedure EditBombaExit(Sender: TObject);
    procedure Critica;
  private
    WMaxTanque : Integer;
    WMaxBombas : Integer;
    WValImposto: Double;
    WValor     : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRegAba: TFormRegAba;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFormRegAba.BotaoLimparClick(Sender: TObject);
begin
  EditTanque.Clear;
  EditBomba.Clear;
  EditLitros.Clear;
  EditValor.Clear;
  LabelCombustivel.Caption := '';
  LabelImposto.Caption := '';
end;

procedure TFormRegAba.Critica;
begin
  if EditTanque.Text = '' then
    raise Exception.Create('Campo Tanque em branco!');

  if EditBomba.Text = '' then
    raise Exception.Create('Campo Bomba em branco!');

  if EditLitros.Text = '' then
    raise Exception.Create('Campo Litros em branco!');

  if EditValor.Text = '' then
    raise Exception.Create('Campo Valor em branco!');

end;

procedure TFormRegAba.EditBombaExit(Sender: TObject);
begin
  if EditBomba.Text <> '' then
    begin
      if StrToInt(EditBomba.Text) = 0 then
        raise Exception.Create('Digite uma bomba válida!');

      if StrToInt(EditBomba.Text) > WMaxBombas then
        begin
          EditBomba.SetFocus;
          raise Exception.Create('A bomba selecionada não existe para este tanque!');
        end;
    end;
end;

procedure TFormRegAba.EditTanqueExit(Sender: TObject);
begin
  if EditTanque.Text <> '' then
    begin
      if StrToInt(EditTanque.Text) = 0 then
        raise Exception.Create('Digite um tanque válido!');

      if StrToInt(EditTanque.Text) <= WMaxTanque then
        begin
          try
            FDQuery1.Close;
            FDQuery1.Open(' Select Nome_Combustivel, Qtd_Bombas From TANQUE Where Cod_Tanque = '+EditTanque.Text);

          finally

          end;

          WMaxBombas := FDQuery1.FieldByName('Qtd_Bombas').AsInteger;
          if FDQuery1.FieldByName('Nome_Combustivel').AsString <> '' then
            begin
              LabelCombustivel.Visible := True;
              LabelCombustivel.Caption := FDQuery1.FieldByName('Nome_Combustivel').AsString;
            end;
        end
      else
        begin
          LabelCombustivel.Visible := False;
          LabelCombustivel.Caption := '';
          raise Exception.Create('O tanque selecionado não existe!');
        end;
    end;
end;

procedure TFormRegAba.EditValorExit(Sender: TObject);
begin
  if EditValor.Text <> '' then
    begin
      WValor := EditValor.Text;
      WValImposto := StrToFloat(StringReplace(EditValor.Text, 'R$ ', '',[rfReplaceAll]));
      EditValor.Text := Format('%m',[WValImposto]);
      WValImposto := ((WValImposto * 13)/100);
      LabelImposto.Visible := True;
      LabelImposto.Caption := 'Imposto de R$ '+Format('%m',[WValImposto]);
    end;
end;

procedure TFormRegAba.BotaoGravarClick(Sender: TObject);
begin
  Critica;
  try
    FDQuery1.Close;
    FDQuery1.SQL.Text :=  ' Insert into Abastecimento Values  '+
                          ' ((select max(Cod_Abastecimento)+1 from Abastecimento) '+
                          ' ,'+QuotedStr(FormatDateTime('yyyy-mm-dd',EditData.Date))+
                          ' ,'+(EditTanque.Text)+
                          ' ,'+QuotedStr(LabelCombustivel.Caption)+
                          ' ,'+(EditBomba.Text)+
                          ' ,'+StringReplace((EditLitros.Text), ',', '.',[rfReplaceAll])+
                          ' ,'+StringReplace((WValor), ',', '.',[rfReplaceAll])+
                          ' ,'+StringReplace(FloatToStr(WValImposto), ',', '.',[rfReplaceAll])+')';
    FDQuery1.ExecSQL;
    ShowMessage('Venda gravada com sucesso!');
  Except
    on E: Exception do
      ShowMessage('Erro ao gravar a venda: ' + E.Message);
  end;
end;

procedure TFormRegAba.FormShow(Sender: TObject);
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

  FDQuery1.Close;
  FDQuery1.Open(' Select max(Cod_Tanque) as Cod_Tanque from TANQUE ');
  WMaxTanque := FDQuery1.FieldByName('Cod_Tanque').AsInteger;
  WMaxBombas := 0;
  EditTanque.SetFocus;
end;

end.
