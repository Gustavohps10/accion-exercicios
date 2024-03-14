unit uTrocaImagem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmTrocaImagem }

  TfrmTrocaImagem = class(TForm)
    btnEscondeImagem: TButton;
    Image1: TImage;
    procedure btnEscondeImagemClick(Sender: TObject);
  private

  public

  end;

var
  frmTrocaImagem: TfrmTrocaImagem;

implementation

{$R *.lfm}

{ TfrmTrocaImagem }

procedure TfrmTrocaImagem.btnEscondeImagemClick(Sender: TObject);
begin
  Image1.Hide;
end;

end.

