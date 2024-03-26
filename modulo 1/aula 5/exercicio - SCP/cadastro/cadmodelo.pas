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
    pnlButtons: TPanel;
    pnlHeader: TPanel;
  private

  public

  end;

var
  CadModeloF: TCadModeloF;

implementation

{$R *.lfm}

end.

