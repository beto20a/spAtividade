unit unProgressBarThread;

interface

uses
  System.Classes,
  Vcl.ComCtrls,
  System.SysUtils;
type
  TProgressBarThread = class(TThread)
  private
    FThreadName: String;
    FProgressBar: TProgressBar;
    FTempoEspera: Integer;
    procedure Initialize;
    procedure UpdateProgressbar;
  protected
    procedure Execute; override;
  public
    property ProgressBar: TProgressBar read FProgressBar write FProgressBar;
    property TempoEspera: Integer read FTempoEspera write FTempoEspera;
    property ThreadName: String read FThreadName write FThreadName;
  end;


implementation

{ TProgressBarThread }

procedure TProgressBarThread.Execute;
var
  i, tempoEsperaMs: Integer;
begin
  Initialize;
  tempoEsperaMs := FTempoEspera * 1000;
  while (Not Terminated) do
  begin
    for i := FProgressBar.Min to FProgressBar.Max do
    begin
      Synchronize(UpdateProgressbar);
      Sleep(tempoEsperaMs);
      if (Terminated) then
        Abort;
    end;
  end;
end;

procedure TProgressBarThread.Initialize;
begin
  FProgressBar.Step := 1;
  FProgressBar.Position := 0;
  FProgressBar.Min := 0;
  FProgressBar.Max := 100;
end;

procedure TProgressBarThread.UpdateProgressbar;
begin
  FProgressBar.StepBy(1);
  FProgressBar.Update;
end;

end.
