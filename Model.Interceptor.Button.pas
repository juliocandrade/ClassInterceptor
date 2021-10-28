unit Model.Interceptor.Button;

interface
uses
  StdCtrls,
  Controls,
  System.Classes;

type
  TButton = class(StdCtrls.TButton)
    private
      State: Boolean;
      Toogle: Boolean;
      procedure SwitchState (Value : Boolean);
    public
      property Checked : Boolean read State write SwitchState;
      property ToogleButton : Boolean read Toogle write Toogle;
      procedure Click; override;
      constructor Create(AOwner : TComponent); override;
  end;
implementation

{ TButton }

procedure TButton.Click;
begin
  if Toogle then
    SwitchState(Not State);
  inherited;
end;

constructor TButton.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TButton.SwitchState(Value: Boolean);
begin
  State := Not State;

  if State then
  begin
      BevelKind := bkFlat;
      BevelInner := bvLowered;
  end
  else
  begin
      BevelKind := bkNone;
      BevelInner := bvRaised;
  end;
end;

end.
