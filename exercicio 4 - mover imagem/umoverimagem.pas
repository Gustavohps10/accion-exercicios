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
var eixos: array of array[37..40] of integer = ((-20, 0, 20, 0), (0, -20, 0, 20)); // esquerda, cima, direita, baixo
begin
    if(Key < 37) or (Key > 40) then
         Exit;
    imgNave.Left := imgNave.Left + eixos[0][Key]; // eixo 0 - horizontal
    imgNave.Top := imgNave.Top + eixos[1][Key];   // eixo 1 - vertical
end;

end.

