object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 2'
  ClientHeight = 305
  ClientWidth = 539
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
    Width = 144
    Height = 13
    Caption = 'Tempo Thread 1 em segundos'
  end
  object Label2: TLabel
    Left = 16
    Top = 80
    Width = 144
    Height = 13
    Caption = 'Tempo Thread 2 em segundos'
  end
  object Label3: TLabel
    Left = 8
    Top = 193
    Width = 92
    Height = 13
    Caption = 'Execu'#231#227'o Thread 1'
  end
  object Label4: TLabel
    Left = 8
    Top = 240
    Width = 92
    Height = 13
    Caption = 'Execu'#231#227'o Thread 2'
  end
  object spTempoThread1: TSpinEdit
    Left = 16
    Top = 32
    Width = 81
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object spTempoThread2: TSpinEdit
    Left = 16
    Top = 96
    Width = 81
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object btExecutarThreads: TButton
    Left = 8
    Top = 144
    Width = 97
    Height = 25
    Caption = 'Executar Threads'
    TabOrder = 2
    OnClick = btExecutarThreadsClick
  end
  object pbThread1: TProgressBar
    Left = 8
    Top = 209
    Width = 393
    Height = 17
    TabOrder = 3
  end
  object pbThread2: TProgressBar
    Left = 8
    Top = 256
    Width = 393
    Height = 17
    TabOrder = 4
  end
end
