unit CadEsqSenha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  BCMaterialDesignButton;

type

  { TCadEsqSenhaF }

  TCadEsqSenhaF = class(TForm)
    btnEntrar: TBCMaterialDesignButton;
    btnCancelar: TBCMaterialDesignButton;
    edtEmail: TEdit;
    edtSenhaNova: TEdit;
    edtConfirmaSenha: TEdit;
    Image1: TImage;
    Image2: TImage;
    imgEntar: TImage;
    imgCancelar: TImage;
    lblEmail: TLabel;
    lblSenhaNova: TLabel;
    lblConfirmaSenha: TLabel;
    pnlTopo: TPanel;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadEsqSenhaF: TCadEsqSenhaF;

implementation

{$R *.lfm}

{ TCadEsqSenhaF }

procedure TCadEsqSenhaF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:=caFree;
end;

procedure TCadEsqSenhaF.btnEntrarClick(Sender: TObject);
begin

end;

end.

