unit unGeradorDataset;

interface
uses
  System.SysUtils,
  System.Classes,
  Datasnap.DBClient,
  Data.DB;
type
  IGeneratorDataset = interface
    ['{97FEB08A-7580-4D85-BDF0-C4D7D4A52B73}']
    procedure CreateDatasetFields;
    procedure FillDataset;
    function  GetSumColumn(AColumnNumber: Integer): double;
    procedure SetNumberOfRegisters(const AValue: Integer);
    function  GetNumberOfRegisters: Integer;
    function  GetSumDiv: double;
    property  NumberOfRegisters: Integer read GetNumberOfRegisters write SetNumberOfRegisters;
  end;

  TGeneratorDataset = class(TInterfacedObject, IGeneratorDataset)
  protected
    FOwner: TComponent;
    FMyDataSet: TClientDataSet;
    FNumberOfRegisters: Integer;
    procedure SetNumberOfRegisters(const AValue: Integer);
    function  GetNumberOfRegisters: Integer;
  public
    constructor Create(AOwner: TComponent; ADataSet: TClientDataSet);
    destructor Destroy; override;
    procedure CreateDatasetFields;
    procedure FillDataset;
    function  GetSumColumn(AColumnNumber: Integer): Double;
    function  GetSumDiv: Double;
    property  NumberOfRegisters: Integer read GetNumberOfRegisters write SetNumberOfRegisters;
  end;

implementation

{ TGeneratorDataset }

constructor TGeneratorDataset.Create(AOwner: TComponent; ADataSet: TClientDataSet);
begin
  FOwner     := AOwner;
  FMyDataSet := ADataSet;
end;

procedure TGeneratorDataset.CreateDatasetFields;
var
  StringField  : TStringField;
  IntegerField : TIntegerField;
  CurrencyField: TCurrencyField;
begin
  IntegerField              := TIntegerField.Create(FOwner);
  IntegerField.FieldName    := 'idProjeto';
  IntegerField.DisplayLabel := 'IdProjeto';
  IntegerField.DataSet      := FMyDataSet;

  StringField               := TStringField.Create(FOwner);
  StringField.FieldName     := 'nomeProjeto';
  StringField.Size          := 80;
  StringField.DataSet       := FMyDataSet;

  CurrencyField             := TCurrencyField.Create(FOwner);
  CurrencyField.FieldName   := 'valor';
  CurrencyField.DataSet     := FMyDataSet;

  FMyDataSet.CreateDataSet;
  FMyDataSet.Open;
end;

destructor TGeneratorDataset.Destroy;
begin
  inherited;
end;

procedure TGeneratorDataset.FillDataset;
var
  countField: Integer;
  countRegister: Integer;
begin
  FMyDataSet.LogChanges := False;
  for countRegister := 1 to FNumberOfRegisters do
  begin
    FMyDataSet.Append;
      for countField := 0 to FMyDataSet.FieldCount - 1 do
      begin
        case FMyDataSet.Fields[countField].DataType of
          ftInteger : FMyDataSet.Fields[countField].AsInteger  := countRegister;
          ftString  : FMyDataSet.Fields[countField].AsString   := 'Projeto ' + intToStr(countRegister);
          ftCurrency: FMyDataSet.Fields[countField].AsCurrency := countRegister * 10;
        end;
      end;
    FMyDataSet.Post;
  end;
end;

function TGeneratorDataset.GetNumberOfRegisters: Integer;
begin
  Result := FNumberOfRegisters;
end;

function TGeneratorDataset.GetSumColumn(AColumnNumber: Integer): Double;
var
  dataType: TFieldType;
begin
  Result := 0;
  dataType := FMyDataSet.Fields[AColumnNumber].DataType;
  if (dataType in [ftSmallint, ftInteger, ftFloat, ftCurrency, ftShortint, ftByte, ftExtended]) then
  begin
    FMyDataSet.First;
    while (not FMyDataSet.Eof) do
    begin
      Result := Result + FMyDataSet.Fields[AColumnNumber].AsVariant;
      FMyDataSet.Next;
    end;
  end;
end;

function TGeneratorDataset.GetSumDiv: Double;
var
  value: double;
  PriorValue: double;
begin
  Result := 0;
  FMyDataSet.First;
  PriorValue := FMyDataSet.Fields[2].AsCurrency;
  FMyDataSet.Next;
  while (not FMyDataSet.Eof) do
  begin
    value := FMyDataSet.Fields[2].AsCurrency;
    Result := Result + (value/PriorValue);
    PriorValue := value;
    FMyDataSet.Next;
  end;
end;

procedure TGeneratorDataset.SetNumberOfRegisters(const AValue: Integer);
begin
  FNumberOfRegisters := AValue;
end;

end.
