unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  DBGrids, ExtCtrls, Types;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    edtTotalLiquido: TEdit;
    edtTotalBruto: TEdit;
    lblTotalBruto: TLabel;
    lblTotalLiquido: TLabel;
    pnlTopo: TPanel;
    grdSalario: TStringGrid;
    procedure grdSalarioEditingDone(Sender: TObject);

  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.grdSalarioEditingDone(Sender: TObject);
var i: integer;
var salarioBruto: double;
var salarioLiquido: double;
var desconto: double;
var totalBruto: double = 0;
var totalLiquido: double = 0;
begin
   for i := 1 to 12 do
    begin
      salarioBruto := StrToFloat(grdSalario.Cells[1, i]);
      desconto := StrToFloat(grdSalario.Cells[2, i]);
      salarioLiquido := salarioBruto - salarioBruto / 100 * desconto;
      grdSalario.Cells[3, i] := floattostrF(salarioLiquido, ffCurrency, 8, 2);
      totalBruto := totalBruto + salarioBruto;
      totalLiquido:= totalLiquido + salarioLiquido;

      edtTotalBruto.Text := FloatToStrF(totalBruto, ffCurrency, 8, 2);
      edtTotalLiquido.Text := FloatToStrF(totalLiquido, ffCurrency, 8, 2);;
    end;
end;

end.

