unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, BCMaterialDesignButton, BGRASpeedButton, BGRAFlashProgressBar,
  BCImageButton, BCMDButtonFocus, BCSVGButton, BCMDButton;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    btnNovo: TBCMaterialDesignButton;
    btnEditar: TBCMaterialDesignButton;
    btnGravar: TBCMaterialDesignButton;
    btnExcluir: TBCMaterialDesignButton;
    btnPesquisar: TBCMaterialDesignButton;
    btnSair: TBCMaterialDesignButton;
    Image1: TImage;
    imgNovo: TImage;
    imgEditar: TImage;
    imgGravar: TImage;
    imgExcluir: TImage;
    imgPesquisar: TImage;
    imgSair: TImage;
    pnlButtons: TPanel;
    pnlHeader: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

{ TCadModeloF }

procedure TCadModeloF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

procedure TCadModeloF.btnSairClick(Sender: TObject);
begin
  Close;
end;



end.

