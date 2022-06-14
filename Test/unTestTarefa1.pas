unit unTestTarefa1;

interface
uses
  DUnitX.TestFramework,
  System.SysUtils,
  System.Classes,
  FireDAC.Phys.PG,
  uspQuery;
type

  [TestFixture]
  TestProvaDelphi = class(TObject)
  private
    FOwner: TComponent;
    spQuery1: TspQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    slColunas: TStringList;
    slTabelas: TStringList;
    slCondicoes: TStringList;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure DeveGerarInstrucaoSQL;
    [Test]
    procedure DeveExistirApenasUmaTabela;
    [Test]
    procedure DevePossuirColunasETabela;
  end;

implementation

uses
  ufTarefa1;


procedure TestProvaDelphi.DeveExistirApenasUmaTabela;
begin
  slTabelas.Add('contatos');
  try
    spQuery1.spTabelas := slTabelas;
  except
    on E: Exception do
      Assert.Fail(E.Message);
  end;
end;

procedure TestProvaDelphi.DeveGerarInstrucaoSQL;
var
  instrucaoSQL: string;
  valorEsperado: string;
begin
  slColunas.Add('nome');
  slColunas.Add('idade');
  slTabelas.Add('contatos');
  slCondicoes.Add('idade = 39');
  spQuery1.spColunas := slColunas;
  spQuery1.spTabelas := slTabelas;
  spQuery1.spCondicoes := slCondicoes;
  spQuery1.GeraSQL;
  valorEsperado := 'select nome' + sLineBreak + ', idade' + sLineBreak + ' From contatos' + sLineBreak + ' Where (idade = 39)';
  instrucaoSQL := spQuery1.SQL.Text;
  Assert.AreEqual(valorEsperado, instrucaoSQL, 'Deve retornar instrução SQL corretamente');
end;

procedure TestProvaDelphi.DevePossuirColunasETabela;
begin
  slColunas.Add('nome');
  slColunas.Add('idade');
  slTabelas.Add('contatos');
  spQuery1.spColunas := slColunas;
  spQuery1.spTabelas := slTabelas;
  spQuery1.spCondicoes := slCondicoes;
 try
  spQuery1.GeraSQL;
  except
    on E: Exception do
      Assert.Fail(E.Message);
  end;
end;

procedure TestProvaDelphi.Setup;
begin
  FDPhysPgDriverLink1 := TFDPhysPgDriverLink.Create(FOwner);
  spQuery1 := TspQuery.Create(FOwner);
  slColunas := TStringList.Create;
  slTabelas := TStringList.Create;
  slCondicoes := TStringList.Create;
end;

procedure TestProvaDelphi.TearDown;
begin
  if (Assigned(spQuery1)) then
    FreeAndNil(spQuery1);
  if (Assigned(FDPhysPgDriverLink1)) then
    FreeAndNil(FDPhysPgDriverLink1);
end;


initialization
  TDUnitX.RegisterTestFixture(TestProvaDelphi);
end.

