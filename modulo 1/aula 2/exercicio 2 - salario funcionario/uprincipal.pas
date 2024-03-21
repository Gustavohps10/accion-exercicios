unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  DBGrids, ExtCtrls, Types;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    lblTotalBruto: TLabel;
    lblTotalLiquido: TLabel;
    pnlTopo: TPanel;
    grdSalario: TStringGrid;
    procedure btnCalcularClick(Sender: TObject);
    procedure grdSalarioDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnCalcularClick(Sender: TObject);
begin

end;

procedure TprincipalF.grdSalarioDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  if (aCol = 0) and (aRow = 1) then
     ShowMessage(grdSalario.Cells[aCol, aRow]);
end;

end.

