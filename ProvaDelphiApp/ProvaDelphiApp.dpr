program ProvaDelphiApp;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {fmPrincipal},
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2},
  unProgressBarThread in 'unProgressBarThread.pas',
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  unGeradorDataset in 'unGeradorDataset.pas';

{$R *.res}

begin

  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.
