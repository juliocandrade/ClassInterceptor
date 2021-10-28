unit Model.Interceptor.Edit;

interface
uses
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Classes;
type
  TEdit = class(Vcl.StdCtrls.TEdit)
  private
    FShape: TShape;
    FMinLength: integer;
    FLblError: TLabel;
    procedure SetMinLength(const Value: integer);
  protected
    procedure Loaded; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Change; override;
  public
    constructor Create(AOwner : TComponent); override;
    property MinLength : integer read FMinLength write SetMinLength;
  end;
implementation

uses
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils;

{ TEdit }

procedure TEdit.Change;
begin
  inherited;
end;

constructor TEdit.Create(AOwner: TComponent);
begin
  inherited;
  FShape := TShape.Create(Self);
  FlblError := TLabel.Create(Self);
end;

procedure TEdit.DoEnter;
begin
  FShape.Pen.Color := clBlue;
  FLblError.Caption := '';
  inherited;
end;

procedure TEdit.DoExit;
begin
  inherited;
  if length(Self.Text) > Pred(FMinLength) then
  begin
    FShape.Pen.Color := clBlack;
  end
  else
  begin
    FShape.Pen.Color := clRed;
    FLblError.Caption := Format('O Campo deve ter no mínimo %d caracteres', [FMinLength]);
  end;
end;

procedure TEdit.Loaded;
begin
  inherited;

  Self.BorderStyle := bsNone;

  FShape.Name := 'Shape' + Self.Name;
  FShape.Parent := Self.Parent;
  FShape.Top := Self.Top - 2;
  FShape.Width := Self.Width + 4;
  FShape.Left := Self.Left - 2;
  FShape.Height := Self.Height + 4;
  FShape.Align := alNone;
  FShape.Shape := stRoundRect;
  FShape.Brush.Style := bsSolid;
  FShape.Brush.Color := clWhite;
  FShape.Pen.Color := clBlack;
  FShape.Pen.Width := 1;
  FShape.Visible := Self.Visible;
  FShape.Enabled := Self.Enabled;

  FlblError.Name := 'lbl' + Self.Name;
  FLblError.Parent := Self.Parent;
  FLblError.Top := Self.Top + 2;
  FLblError.Left := Self.Left + Self.Width + 10;
  FLblError.Font.Color := clRed;
  FLblError.Caption := '';
end;

procedure TEdit.SetMinLength(const Value: integer);
begin
  if Value > 0 then
    FMinLength := Value;
end;

end.
