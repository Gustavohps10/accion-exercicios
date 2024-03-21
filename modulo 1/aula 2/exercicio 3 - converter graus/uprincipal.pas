unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    edtCelsius: TEdit;
    edtFahrenheit: TEdit;
    lblCelsius: TLabel;
    lblFahrenheit: TLabel;
    pnlTop: TPanel;
    procedure edtCelsiusEditingDone(Sender: TObject);
    procedure edtFahrenheitEditingDone(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.edtCelsiusEditingDone(Sender: TObject);
var grau: double;
begin
    grau := StrToFloat(edtCelsius.text);
    edtFahrenheit.text := FloatToStr(grau * 1.8 + 32);
end;

procedure TprincipalF.edtFahrenheitEditingDone(Sender: TObject);
var fahrenheit: double;
begin
   fahrenheit := StrToFloat(edtFahrenheit.text);
   edtCelsius.text := FloatToStr(5/9 * (fahrenheit - 32));
end;

end.

