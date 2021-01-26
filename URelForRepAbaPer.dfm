object FormFRrelatorio: TFormFRrelatorio
  Left = 0
  Top = 0
  Caption = 'FormFRrelatorio'
  ClientHeight = 575
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RLReportRelatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object BandaTopo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      object LabelEmpresa: TRLLabel
        Left = 3
        Top = 3
        Width = 165
        Height = 16
        Caption = 'Posto de Combust'#237'ves ABC'
      end
      object LabelPagina: TRLLabel
        Left = 566
        Top = 2
        Width = 56
        Height = 16
        Caption = 'P'#225'gina : '
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 628
        Top = 1
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object LabelData: TRLLabel
        Left = 566
        Top = 17
        Width = 59
        Height = 16
        Caption = 'Emiss'#227'o:'
      end
      object LabelHora: TRLLabel
        Left = 566
        Top = 39
        Width = 35
        Height = 16
        Anchors = [fkRight]
        Caption = 'Hora:'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 644
        Top = 17
        Width = 71
        Height = 16
        Alignment = taRightJustify
        Anchors = [fkTop, fkRight]
        Text = ''
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 644
        Top = 39
        Width = 71
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
      end
    end
    object BandaCabecalho: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 40
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 3
        Top = 2
        Width = 122
        Height = 16
        Caption = 'C'#243'd. Abastecimento'
      end
      object RLLabel2: TRLLabel
        Left = 129
        Top = 2
        Width = 72
        Height = 16
        Caption = 'Data'
      end
      object RLLabel3: TRLLabel
        Left = 205
        Top = 2
        Width = 77
        Height = 16
        Caption = 'C'#243'd. Tanque'
      end
      object RLLabel4: TRLLabel
        Left = 287
        Top = 2
        Width = 82
        Height = 16
        Caption = 'Combust'#237'vel'
      end
      object RLLabel5: TRLLabel
        Left = 375
        Top = 2
        Width = 76
        Height = 16
        Caption = 'C'#243'd. Bomba'
      end
      object RLLabel6: TRLLabel
        Left = 458
        Top = 2
        Width = 65
        Height = 16
        Caption = 'Qtd. Litros'
      end
      object RLLabel7: TRLLabel
        Left = 529
        Top = 2
        Width = 92
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor Venda'
      end
      object RLLabel8: TRLLabel
        Left = 624
        Top = 2
        Width = 91
        Height = 16
        Alignment = taRightJustify
        Caption = 'Imposto Venda'
      end
    end
    object BandaDetalhe: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 48
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 122
        Height = 16
        Alignment = taCenter
        DataField = 'Cod_Abastecimento'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 129
        Top = 3
        Width = 72
        Height = 16
        Alignment = taCenter
        DataField = 'Data_Abastecimento'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 205
        Top = 3
        Width = 77
        Height = 16
        Alignment = taCenter
        DataField = 'Cod_Tanque'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 287
        Top = 3
        Width = 82
        Height = 16
        Alignment = taCenter
        DataField = 'Nome_Combustivel'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 375
        Top = 3
        Width = 76
        Height = 16
        Alignment = taCenter
        DataField = 'Cod_Bomba'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 458
        Top = 3
        Width = 65
        Height = 16
        Alignment = taCenter
        DataField = 'Qtd_Litros'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 529
        Top = 3
        Width = 92
        Height = 16
        Alignment = taRightJustify
        DataField = 'Valor_Venda'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 624
        Top = 3
        Width = 91
        Height = 16
        Alignment = taRightJustify
        DataField = 'Imposto_Venda'
        DataSource = DataSource1
        Text = ''
      end
    end
    object BandaFooter: TRLBand
      Left = 38
      Top = 213
      Width = 718
      Height = 40
      BandType = btFooter
      Transparent = False
      object RLLabel9: TRLLabel
        Left = 583
        Top = 3
        Width = 132
        Height = 14
        Caption = 'Feito por Thiago Rodrigues'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object BandaAcumulado: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 28
      BandType = btColumnFooter
      BeforePrint = BandaAcumuladoBeforePrint
      object LabelValorAcu: TRLLabel
        Left = 529
        Top = 6
        Width = 92
        Height = 16
        Alignment = taRightJustify
      end
      object LabelLitrosAcu: TRLLabel
        Left = 458
        Top = 6
        Width = 65
        Height = 16
        Alignment = taCenter
      end
      object LabelImpoAcu: TRLLabel
        Left = 624
        Top = 6
        Width = 91
        Height = 16
        Alignment = taRightJustify
      end
      object RLLabel10: TRLLabel
        Left = 309
        Top = 6
        Width = 85
        Height = 16
        Caption = 'Totalizadores:'
      end
    end
  end
  object ConexaoSql: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 71
    Top = 296
  end
  object FDQuery1: TFDQuery
    Connection = ConexaoSql
    Left = 71
    Top = 376
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 71
    Top = 440
  end
  object FDQuery2: TFDQuery
    Connection = ConexaoSql
    Left = 207
    Top = 376
  end
end
