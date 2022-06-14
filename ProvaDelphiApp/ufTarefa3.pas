unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, unGeradorDataset;

type
  TOperationProcedure = reference to procedure;

  TfTarefa3 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    btObterTotal: TButton;
    btTotalDivisoes: TButton;
    edTotal: TEdit;
    edTotalDivisoes: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btObterTotalClick(Sender: TObject);
    procedure btTotalDivisoesClick(Sender: TObject);
  private
    dsProjeto: TDataSource;
    CdsProjeto: TClientDataSet;
    GeradorDataSet: IGeneratorDataset;
    { Private declarations }
    procedure ConfigureDataSource;
    procedure LinkDataSourceToGrid(AGrid: TDBGrid);
    procedure OperationInDataSet(ADataSet: TClientDataSet; AProcOperation: TOperationProcedure);
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btObterTotalClick(Sender: TObject);
begin
  OperationInDataSet(CdsProjeto, procedure
  begin
    edTotal.Text := FormatFloat('#.,00', GeradorDataSet.GetSumColumn(2));
  end);
end;

procedure TfTarefa3.btTotalDivisoesClick(Sender: TObject);
begin
  OperationInDataSet(CdsProjeto, procedure
  begin
    edTotalDivisoes.Text := FormatFloat('#.,00', GeradorDataSet.GetSumDiv);
  end);
end;

procedure TfTarefa3.ConfigureDataSource;
begin
  dsProjeto := TDataSource.Create(self);
  dsProjeto.DataSet := CdsProjeto;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action   := caFree;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  cdsProjeto := TClientDataSet.Create(self);
  GeradorDataSet := TGeneratorDataset.Create(self, CdsProjeto);
  GeradorDataSet.NumberOfRegisters := 10;
  screen.Cursor := crAppStart;
  try
    GeradorDataSet.CreateDatasetFields;
    GeradorDataSet.FillDataset;
  finally
    screen.Cursor := crDefault;
  end;
  ConfigureDataSource;
  LinkDataSourceToGrid(dbGrid1);
end;

procedure TfTarefa3.LinkDataSourceToGrid(AGrid: TDBGrid);
begin
  AGrid.DataSource := dsProjeto;
end;

procedure TfTarefa3.OperationInDataSet(ADataSet: TClientDataSet; AProcOperation: TOperationProcedure);
var
  Bookmark: TBookmark;
begin
  Bookmark := ADataSet.GetBookmark;
  ADataSet.DisableControls;
  Screen.Cursor := CrAppStart;
  try
    AProcOperation;
  finally
    ADataSet.GotoBookmark(Bookmark);
    ADataSet.EnableControls;
    Screen.Cursor := CrDefault;
  end;
end;

end.
