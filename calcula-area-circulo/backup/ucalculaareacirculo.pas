unit uCalculaAreaCirculo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Math;

type

  { TfrmCalculaAreaCirculo }

  TfrmCalculaAreaCirculo = class(TForm)
    btnCalcular: TButton;
    edtRaioCirculo: TEdit;
    lblAreaCirculo: TLabel;
    lblRaio: TLabel;
    pnlCalculo: TPanel;
    procedure btnCalcularClick(Sender: TObject);
  private

  public
    function calculaAreaCirculo(raio: Double): Double;

  end;

var
  frmCalculaAreaCirculo: TfrmCalculaAreaCirculo;

implementation

{$R *.lfm}

{ TfrmCalculaAreaCirculo }

procedure TfrmCalculaAreaCirculo.btnCalcularClick(Sender: TObject);
begin
    lblAreaCirculo.Caption := 'Area do circulo: ' + FloatToStrF(calculaAreaCirculo(StrToFloat(edtRaioCirculo.text)), ffCurrency, 8, 2);
end;

function TfrmCalculaAreaCirculo.calculaAreaCirculo(raio: Double): Double;
begin
   Result := Pi * Power(raio, 2);
end;

end.

