unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfmPrincipal = class(TForm)
    mmPrincipal: TMainMenu;
    miTarefas: TMenuItem;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    procedure miTarefa1Click(Sender: TObject);
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

uses
  ufTarefa1,
  ufTarefa2,
  ufTarefa3;

{$R *.dfm}

procedure TfmPrincipal.miTarefa3Click(Sender: TObject);
begin
  fTarefa3 := TfTarefa3.Create(self);
  fTarefa3.Show;
end;

procedure TfmPrincipal.miTarefa1Click(Sender: TObject);
begin
  fTarefa1 := TfTarefa1.Create(self);
  fTarefa1.Show;
end;

procedure TfmPrincipal.miTarefa2Click(Sender: TObject);
begin
  fTarefa2 := TfTarefa2.Create(self);
  fTarefa2.Show;
end;

end.
