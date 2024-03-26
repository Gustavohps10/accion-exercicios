unit Frame.Produto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, ExtCtrls, StdCtrls;

type

  { TFrameProduto }

  TFrameProduto = class(TFrame)
    btnAdicionar: TButton;
    btnRemover: TButton;
    imgFoto: TImage;
    lblQuantidade: TLabel;
    lblNomeProduto: TLabel;
    lblPrecoProduto: TLabel;
  private

  public

  end;

implementation

{$R *.lfm}

end.

