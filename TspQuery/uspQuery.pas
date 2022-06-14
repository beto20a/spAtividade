unit uspQuery;

interface

uses
  System.SysUtils,
  System.Classes,
  StrUtils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;
type

  TspQuery = class(TFDQuery)
  private
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
    function formatString(AValue: String): String;
    procedure SetSpTabelas(const Value: TStringList);
  public
    procedure GeraSQL();
  published
    property spCondicoes: TStringList read FspCondicoes write FspCondicoes;
    property spColunas  : TStringList read FspColunas   write FspColunas;
    property spTabelas  : TStringList read FspTabelas   write SetSpTabelas;
  end;
implementation

{ TspQuery }

function TspQuery.formatString(AValue: String): String;
  function IsNum(AValue: string): boolean;
  var
    OutVar: Integer;
  begin
    Result := TryStrToInt(AValue,OutVar);
  end;

const
  Symbols: array[0..5] of string = ('=','>','<','>=','<=','<>');
var
  i: integer;
  symbol: string;
  valorProcurado: string;
  campoProcurado: string;
  indexPesquisa: integer;
begin
  Result := AValue;
  valorProcurado := '';
  campoProcurado := '';
  symbol := '';

  for i := Low(Symbols) to High(Symbols) do
  begin
    if AValue.Contains(Symbols[i]) then
    begin
      symbol := Symbols[i];
      break;
    end;
  end;

  if (not SameText(symbol, '')) then
  begin
    indexPesquisa  := pos(symbol, AValue);
    campoProcurado := copy(AValue, 0, indexPesquisa);
    valorProcurado := copy(AValue, indexPesquisa + 1, AValue.Length);
    valorProcurado := trim(valorProcurado);
    if (not isNum(valorProcurado)) then
      if pos(chr(39), valorProcurado) = 0 then
        valorProcurado := quotedStr(valorProcurado);

    Result := campoProcurado + ' ' + valorProcurado;
  end;
end;

procedure TspQuery.GeraSQL;
var
  sqlSb: TStringBuilder;
  countColunas, countCondicoes: Integer;
begin
  if (FspColunas.Count = 0) or (FspTabelas.Count = 0) then
    raise Exception.Create('Propriedade spColunas e spTabelas não podem ficar vazias');

  sqlSb := TStringBuilder.Create;
  sqlSb.Append('Select ');
  for countColunas := 0 to FspColunas.Count - 1 do
  begin
    sqlSb
      .Append(IfThen(countColunas > 0, ', ', ''))
      .Append(FspColunas[countColunas])
      .Append(sLineBreak)
  end;

  sqlSb
    .Append(' From ')
    .Append(self.FspTabelas[0]);

  for countCondicoes := 0 to FspCondicoes.Count - 1 do
  begin
    sqlSb
      .Append(ifThen(countCondicoes = 0, sLineBreak +' Where ', ''))
      .Append(ifThen(countCondicoes > 0, ' And ', ''))
      .Append('(')
      .Append(formatString(FspCondicoes[countCondicoes]))
      .Append(')')
      .Append(sLineBreak);
  end;

  self.SQL.Text := sqlSb.toString();
  FreeAndNil(sqlSb);
end;

procedure TspQuery.SetSpTabelas(const Value: TStringList);
begin
  if Value.Count > 1 then
  begin
    FspTabelas := nil;
    raise Exception.Create('É Permitido adicionar apenas uma tabela');
  end;
  FspTabelas := Value;
end;

end.
