unit uTrocaImagem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmTrocaImagem }

  TfrmTrocaImagem = class(TForm)
    btnEscondeImagem: TButton;
    imgEsconder: TImage;
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
  imgEsconder.Visible := Not imgEsconder.Visible;
end;

end.

