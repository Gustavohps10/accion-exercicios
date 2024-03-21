unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnCalcular: TButton;
    edtCustoFabrica: TEdit;
    edtPorcentagemDistribuidor: TEdit;
    edtImposto: TEdit;
    edtCustoConsumidor: TEdit;
    lblCustoFabrica: TLabel;
    lblPorcentagemDistribuidor: TLabel;
    lblImposto: TLabel;
    lblCustoConsumidor: TLabel;
    Panel1: TPanel;
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
var custoFabrica, porcentagemDistribuidor, imposto, custoConsumidor, valorImposto: double;
begin
     custoFabrica := StrToFloat(edtCustoFabrica.text);
     porcentagemDistribuidor := StrToFloat(edtPorcentagemDistribuidor.text);
     imposto := StrToFloat(edtImposto.text);
     custoConsumidor := custoFabrica + (custoFabrica/100 * porcentagemDistribuidor) + (custoFabrica/100*imposto);

     edtCustoConsumidor.Text:= FloatToStrF(custoConsumidor, ffCurrency, 8, 2);
end;

end.

