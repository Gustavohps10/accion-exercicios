unit uMoverImagem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus;

type

  { TfrmMoverImagem }

  TfrmMoverImagem = class(TForm)
    imgNave: TImage;
    imgArrows: TImage;
    lblPressione: TLabel;
    lblParaMover: TLabel;
    pnlFundo: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  frmMoverImagem: TfrmMoverImagem;

implementation

{$R *.lfm}

{ TfrmMoverImagem }

procedure TfrmMoverImagem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var eixos: array['x'..'y'] of array[37..40] of integer = ((-20, 0, 20, 0), (0, -20, 0, 20)); // -20 esquerda, +20 direita, -20 cima, +20 baixo
begin
    if (Key < 37) or (Key > 40) then  //aceita somente keys 37,38,39 e 40 ← ↑ → ↓
         Exit;
    imgNave.Left := imgNave.Left + eixos['x'][Key]; // eixo x - horizontal
    imgNave.Top := imgNave.Top + eixos['y'][Key];   // eixo y - vertical
end;

end.

