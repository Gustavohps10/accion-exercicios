unit CadEsqSenha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TCadEsqSenhaF }

  TCadEsqSenhaF = class(TForm)
    btnEntrar: TButton;
    btnCancelar: TButton;
    edtEmail: TEdit;
    edtSenhaNova: TEdit;
    edtConfirmaSenha: TEdit;
    Image1: TImage;
    Image2: TImage;
    lblEmail: TLabel;
    lblSenhaNova: TLabel;
    lblConfirmaSenha: TLabel;
    pnlTopo: TPanel;
    procedure btnCancelarClick(Sender: TObject);
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

procedure TCadEsqSenhaF.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.

