unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery, Vcl.StdCtrls,
  FireDAC.Phys.PGDef, FireDAC.Phys, FireDAC.Phys.PG;

type
  TfTarefa1 = class(TForm)
    Label1: TLabel;
    mmoColunas: TMemo;
    mmoTabelas: TMemo;
    Label2: TLabel;
    mmoCondicoes: TMemo;
    Label3: TLabel;
    btnGeraSql: TButton;
    mmoSqlGerado: TMemo;
    Label4: TLabel;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    spQuery1: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSqlClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSqlClick(Sender: TObject);
begin
  spQuery1.spColunas   := TStringList(mmoColunas.Lines);
  spQuery1.spTabelas   := TStringList(mmoTabelas.Lines);
  spQuery1.spCondicoes := TStringList(mmoCondicoes.Lines);
  spQuery1.GeraSQL;
  mmoSqlGerado.Lines.Text := spQuery1.SQL.Text;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  fTarefa1 := nil;
end;

end.
