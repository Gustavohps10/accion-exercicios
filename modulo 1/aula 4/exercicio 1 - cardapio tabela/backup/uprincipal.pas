unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, ExtCtrls,
  StdCtrls, CheckLst;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    cbEmbalagem: TCheckBox;
    clbProdutos: TCheckListBox;
    edtTotal: TEdit;
    lblPrecoEntrega: TLabel;
    lblTotal: TLabel;
    Panel1: TPanel;
    grdProdutos: TStringGrid;
    procedure cbEmbalagemClick(Sender: TObject);
    procedure clbProdutosClickCheck(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;
  total: double = 0;

implementation

{$R *.lfm}

{ TprincipalF }


procedure TprincipalF.clbProdutosClickCheck(Sender: TObject);
var i: integer;
  var precoProduto: double;
begin
  total := 0;
  for  i:= 1 to 6 do
  begin
       if clbProdutos.Checked[i-1] then
       begin
          precoProduto := strtofloat(grdProdutos.Cells[2, i]);
          total := total + precoProduto;
       end;
  end;

  edtTotal.text := FloatToStrF(total, ffCurrency, 8, 2);
end;

procedure TprincipalF.cbEmbalagemClick(Sender: TObject);
begin
  if cbEmbalagem.Checked then
  begin
     total := total + 4;
  end
  else
  begin
      total := total - 4;
  end;

  edtTotal.text := FloatToStrF(total, ffCurrency, 8, 2);
end;

end.

