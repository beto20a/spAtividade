object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 384
  ClientWidth = 684
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 96
    Height = 13
    Caption = 'Valores por projeto:'
  end
  object Label2: TLabel
    Left = 552
    Top = 293
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object Label3: TLabel
    Left = 552
    Top = 337
    Width = 85
    Height = 13
    Caption = 'Total divis'#245'es R$:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 665
    Height = 233
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btObterTotal: TButton
    Left = 464
    Top = 307
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = btObterTotalClick
  end
  object btTotalDivisoes: TButton
    Left = 432
    Top = 351
    Width = 107
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 2
    OnClick = btTotalDivisoesClick
  end
  object edTotal: TEdit
    Left = 552
    Top = 309
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edTotalDivisoes: TEdit
    Left = 552
    Top = 353
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
