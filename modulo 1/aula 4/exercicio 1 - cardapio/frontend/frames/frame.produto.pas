unit Frame.Produto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, ExtCtrls, StdCtrls,
  BCMDButtonFocus, BCMaterialDesignButton, BGRAShape, BCMaterialEdit;

type

  { TFrameProduto }

  TFrameProduto = class(TFrame)
    btnFundo: TBCMaterialDesignButton;
    btnAdicionar: TBCMaterialDesignButton;
    btnRemover: TBCMaterialDesignButton;
    imgFavorito: TImage;
    imgAdicionar: TImage;
    imgRemover: TImage;
    imgFoto: TImage;
    lblQuantidade: TLabel;
    lblNomeProduto: TLabel;
    lblPrecoProduto: TLabel;
    lblSubtotal: TLabel;
  private

  public

  end;

implementation

{$R *.lfm}

{ TFrameProduto }


end.

