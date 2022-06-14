unit unTestTarefa3;

interface
uses
  DUnitX.TestFramework,
  System.SysUtils,
  Datasnap.DBClient,
  unGeradorDataset,
  ufTarefa3,
  System.Classes;
type

  [TestFixture]
  TestProvaDelphi = class(TObject)
  private
    FOwner: TComponent;
    DataSet: TClientDataSet;
    GeradorDataSet: IGeneratorDataSet;
    procedure BuildDataSet;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure DataSetDeveSerCriadoComDezRegistros;
    [Test]
    procedure SomaDosValoresParaDezRegistros;
    [Test]
    procedure SomaValoresDividindo;
  end;

implementation


procedure TestProvaDelphi.BuildDataSet;
begin
  GeradorDataSet.NumberOfRegisters := 10;
  GeradorDataSet.FillDataset;
end;

procedure TestProvaDelphi.DataSetDeveSerCriadoComDezRegistros;
begin
  GeradorDataSet.NumberOfRegisters := 10;
  GeradorDataSet.FillDataset;
  Assert.AreEqual(10, DataSet.RecordCount, 'DataSet deve retornar 10 registros');
end;

procedure TestProvaDelphi.Setup;
begin
  DataSet := TClientDataSet.Create(FOwner);
  GeradorDataSet := TGeneratorDataSet.Create(FOwner, DataSet);
  GeradorDataSet.CreateDatasetFields;
end;

procedure TestProvaDelphi.SomaDosValoresParaDezRegistros;
var
  somaValores: double;
  valorEsperado: double;
begin
  valorEsperado := 550;
  BuildDataSet;
  somaValores := GeradorDataSet.GetSumColumn(2);
  Assert.AreEqual(valorEsperado, somaValores, 'Soma dos valores para 10 registros deve retornar ' + FloatToStr(valorEsperado));
end;

procedure TestProvaDelphi.SomaValoresDividindo;
var
  somaValoresDividindo: string;
  valorEsperado: string;
begin
  BuildDataSet;
  valorEsperado := '11,83';
  somaValoresDividindo := FormatFloat('#.,00', GeradorDataSet.GetSumDiv);
  Assert.AreEqual(valorEsperado, somaValoresDividindo, 'Soma dos valores dividindo com 10 registros deve retornar ' + valorEsperado);
end;

procedure TestProvaDelphi.TearDown;
begin
  if Assigned(DataSet) then
    FreeAndNil(DataSet);
end;

initialization
  TDUnitX.RegisterTestFixture(TestProvaDelphi);
end.
