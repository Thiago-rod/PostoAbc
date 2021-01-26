object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sistema Posto ABC'
  ClientHeight = 161
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 77
    Width = 255
    Height = 13
    Caption = 'Clique na caixa abaixo para carregar o arquivo de BD'
  end
  object EditDirBd: TEdit
    Left = 8
    Top = 96
    Width = 321
    Height = 21
    TabOrder = 0
    Text = 'Clique aqui...'
    OnClick = EditDirBdClick
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 8
    object Relatrio1: TMenuItem
      Caption = 'Vendas'
      object RelatriodeVendasporPerodo1: TMenuItem
        Caption = 'Registrar Novo Abastecimento'
        OnClick = RelatriodeVendasporPerodo1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object RelatriodeAbastecimentosporPerodo1: TMenuItem
        Caption = 'Relat'#243'rio de Abastecimentos por Per'#237'odo'
        OnClick = RelatriodeAbastecimentosporPerodo1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 304
    Top = 32
  end
end
