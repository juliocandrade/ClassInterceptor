program ClassInterceptor;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {Form2},
  Model.Interceptor.Button in 'Model.Interceptor.Button.pas',
  Model.Interceptor.Edit in 'Model.Interceptor.Edit.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
