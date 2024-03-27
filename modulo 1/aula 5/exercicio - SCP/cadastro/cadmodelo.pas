unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    btnSair: TButton;
    Image1: TImage;
    imgBtnPesquisar: TImage;
    imgBtnNovo: TImage;
    imgBtnEditar: TImage;
    imgBtnGravar: TImage;
    imgBtnExcluir: TImage;
    lblPesquisar: TLabel;
    lblNovo: TLabel;
    lblEditar: TLabel;
    lblGravar: TLabel;
    lblExcluir: TLabel;
    pnlButtons: TPanel;
    pnlHeader: TPanel;
    sbtPesquisar: TSpeedButton;
    sbtNovo: TSpeedButton;
    sbtEditar: TSpeedButton;
    sbtGravar: TSpeedButton;
    sbtExcluir: TSpeedButton;
    shpPesquisar: TShape;
    shpNovo: TShape;
    shpEditar: TShape;
    shpGravar: TShape;
    shpExcluir: TShape;
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

