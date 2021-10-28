unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Model.Interceptor.Edit, Model.Interceptor.Button;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if edit1.Modified then
    Edit2.Text := 'Ligado'
  else
    Edit2. Text := 'Desligado';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Button1.ToogleButton := true;
  Edit1.Text := 'teste';
  Edit1.MinLength := 2
end;

end.
