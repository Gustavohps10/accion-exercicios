unit CadModelo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TCadModeloF }

  TCadModeloF = class(TForm)
    btnNovo: TButton;
    btnEditar: TButton;
    btnGravar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    Image1: TImage;
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

