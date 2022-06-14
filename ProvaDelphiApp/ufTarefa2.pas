unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, unProgressBarThread;

type
  TfTarefa2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    spTempoThread1: TSpinEdit;
    spTempoThread2: TSpinEdit;
    btExecutarThreads: TButton;
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    procedure btExecutarThreadsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    pbt1: TProgressBarThread;
    pbt2: TProgressBarThread;
    procedure EncerraThread(AThread: TProgressBarThread);
    procedure OnTerminate(ASender: TObject);
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation



{$R *.dfm}

procedure TfTarefa2.btExecutarThreadsClick(Sender: TObject);

begin
  pbt1 := TProgressBarThread.Create(true);
  pbt2 := TProgressBarThread.Create(true);

  pbt1.ThreadName  := 'Thread 1';
  pbt1.ProgressBar := pbThread1;
  pbt1.TempoEspera := spTempoThread1.Value;
  pbt1.OnTerminate := OnTerminate;

  pbt2.ThreadName  := 'Thread 2';
  pbt2.ProgressBar := pbThread2;
  pbt2.TempoEspera := spTempoThread2.Value;
  pbt2.OnTerminate := OnTerminate;

  pbt1.Start;
  pbt2.Start;
end;

procedure TfTarefa2.EncerraThread(AThread: TProgressBarThread);
begin
  if (Assigned(AThread)) then
  begin
    AThread.Terminate;
    if not (AThread.Suspended) then
      AThread.WaitFor;

    FreeAndNil(AThread);
  end;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EncerraThread(pbt1);
  EncerraThread(pbt2);
  action := caFree;
  fTarefa2 := nil;
end;

procedure TfTarefa2.OnTerminate(ASender: TObject);
begin
  ShowMessage('Thread ' + (ASender As TProgressBarThread).ThreadName + ' encerrada.');
end;

end.
