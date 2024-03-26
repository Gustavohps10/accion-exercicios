unit CadProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadProdutosF }

  TCadProdutosF = class(TCadModeloF)
    cbTipoProduto: TComboBox;
    edtDescSimples: TEdit;
    edtValorVenda: TEdit;
    edtIdCadProduto: TEdit;
    lblTipoProduto: TLabel;
    lblDescCompleta: TLabel;
    lblDescSimples: TLabel;
    lblValorVenda: TLabel;
    lblIdProduto: TLabel;
    memoDescCompleta: TMemo;
  private

  public

  end;

var
  CadProdutosF: TCadProdutosF;

implementation

{$R *.lfm}

end.

