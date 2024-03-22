unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnCalcular: TButton;
    edtNumero: TEdit;
    lblDigiteNumero: TLabel;
    mmoTabuada: TMemo;
    pnlTopo: TPanel;
    procedure btnCalcularClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnCalcularClick(Sender: TObject);
var numeroDigitado: integer;
var i: integer;
begin
  mmoTabuada.Clear();
  numeroDigitado := StrToInt(edtNumero.text);
  for i := 1 to 10 do
  begin
      mmoTabuada.Append(inttostr(numeroDigitado) + ' x '+ inttostr(i) + ' = ' + inttostr(numeroDigitado*i));
  end;
end;

end.

