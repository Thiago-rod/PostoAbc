object FormRelAbaPer: TFormRelAbaPer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimento por Per'#237'odo'
  ClientHeight = 158
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BoxFiltro: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 137
    Caption = 'Filtro'
    TabOrder = 0
    object LabelInicio: TLabel
      Left = 16
      Top = 32
      Width = 25
      Height = 13
      Caption = 'In'#237'cio'
    end
    object LabelFim: TLabel
      Left = 130
      Top = 32
      Width = 16
      Height = 13
      Caption = 'Fim'
    end
    object DataIni: TDateTimePicker
      Left = 16
      Top = 51
      Width = 97
      Height = 21
      Date = 44222.098182372680000000
      Time = 44222.098182372680000000
      TabOrder = 0
    end
    object DataFim: TDateTimePicker
      Left = 130
      Top = 51
      Width = 97
      Height = 21
      Date = 44222.098300300920000000
      Time = 44222.098300300920000000
      TabOrder = 1
    end
    object BotaoVisualizar: TButton
      Left = 16
      Top = 91
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 2
      OnClick = BotaoVisualizarClick
    end
  end
end
