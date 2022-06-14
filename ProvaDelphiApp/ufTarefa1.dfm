object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'Tarefa 1'
  ClientHeight = 266
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object Label2: TLabel
    Left = 216
    Top = 16
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object Label3: TLabel
    Left = 416
    Top = 16
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object Label4: TLabel
    Left = 16
    Top = 152
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object mmoColunas: TMemo
    Left = 16
    Top = 32
    Width = 185
    Height = 89
    TabOrder = 0
  end
  object mmoTabelas: TMemo
    Left = 216
    Top = 32
    Width = 185
    Height = 89
    TabOrder = 1
  end
  object mmoCondicoes: TMemo
    Left = 416
    Top = 32
    Width = 185
    Height = 89
    TabOrder = 2
  end
  object btnGeraSql: TButton
    Left = 618
    Top = 64
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSqlClick
  end
  object mmoSqlGerado: TMemo
    Left = 16
    Top = 168
    Width = 675
    Height = 89
    TabOrder = 4
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 576
    Top = 128
  end
  object spQuery1: TspQuery
    Left = 640
    Top = 104
  end
end
