unit uCadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  DBGrids, StdCtrls, ZDataset, BCMaterialDesignButton;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    btnGravar: TBCMaterialDesignButton;
    btnCancelar: TBCMaterialDesignButton;
    btnExcluir: TBCMaterialDesignButton;
    btnFechar: TBCMaterialDesignButton;
    btnPesquisar: TBCMaterialDesignButton;
    btnNovo: TBCMaterialDesignButton;
    btnEditar: TBCMaterialDesignButton;
    dsCadModelo: TDataSource;
    DBGrid1: TDBGrid;
    edtPesquisar: TEdit;
    imgEditar: TImage;
    imgGravar: TImage;
    imgCancelar: TImage;
    imgDeletar: TImage;
    imgSair: TImage;
    imgPesquisa: TImage;
    imgNovo: TImage;
    pnlBordaPesquisa: TPanel;
    pnlRodape: TPanel;
    pnlCabecalhoConteudo: TPanel;
    pgcPrincipal: TPageControl;
    pnlCabecalho: TPanel;
    tbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    qryCad: TZQuery;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
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
  CloseAction:=caFree;
end;

procedure TCadModeloF.btnCancelarClick(Sender: TObject);
begin
  qryCad.Cancel;
  pgcPrincipal.ActivePage := tbPesquisa;
end;

procedure TCadModeloF.btnEditarClick(Sender: TObject);
begin
  qryCad.Post;
end;

procedure TCadModeloF.btnExcluirClick(Sender: TObject);
begin
  qryCad.Delete;
end;

procedure TCadModeloF.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadModeloF.btnGravarClick(Sender: TObject);
begin
  qryCad.Post;
end;

end.

