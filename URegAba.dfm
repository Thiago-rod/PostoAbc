object FormRegAba: TFormRegAba
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Novo Abastecimento'
  ClientHeight = 296
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BoxNovoAbastecimento: TGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 273
    Caption = 'Dados do Abastecimento'
    TabOrder = 0
    object LabelBomba: TLabel
      Left = 27
      Top = 48
      Width = 39
      Height = 16
      Caption = 'Bomba'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelLitros: TLabel
      Left = 27
      Top = 75
      Width = 31
      Height = 16
      Caption = 'Litros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelValor: TLabel
      Left = 27
      Top = 102
      Width = 30
      Height = 16
      Caption = 'Valor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelData: TLabel
      Left = 27
      Top = 129
      Width = 26
      Height = 16
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelTanque: TLabel
      Left = 27
      Top = 21
      Width = 43
      Height = 16
      Caption = 'Tanque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LabelCombustivel: TLabel
      Left = 27
      Top = 165
      Width = 133
      Height = 18
      Caption = 'LabelCombustivel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LabelImposto: TLabel
      Left = 27
      Top = 191
      Width = 102
      Height = 18
      Caption = 'LabelImposto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object BotaoLimpar: TButton
      Left = 151
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 5
      OnClick = BotaoLimparClick
    end
    object BotaoGravar: TButton
      Left = 27
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Gravar '
      TabOrder = 4
      OnClick = BotaoGravarClick
    end
    object EditBomba: TEdit
      Left = 185
      Top = 47
      Width = 41
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      OnExit = EditBombaExit
    end
    object EditLitros: TEdit
      Left = 168
      Top = 74
      Width = 58
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object EditTanque: TEdit
      Left = 185
      Top = 20
      Width = 41
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnExit = EditTanqueExit
    end
    object EditValor: TEdit
      Left = 130
      Top = 101
      Width = 96
      Height = 21
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnExit = EditValorExit
    end
    object EditData: TDateTimePicker
      Left = 130
      Top = 128
      Width = 96
      Height = 21
      Date = 44221.991404224540000000
      Time = 44221.991404224540000000
      TabOrder = 6
    end
  end
  object ConexaoSql: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 247
    Top = 80
  end
  object FDQuery1: TFDQuery
    Connection = ConexaoSql
    Left = 247
    Top = 160
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 247
    Top = 224
  end
end
