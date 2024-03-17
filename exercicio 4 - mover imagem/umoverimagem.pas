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
var horizontal: array[37..40] of integer = (-20, 0, 20, 0); // esquerda, cima, direita, baixo
var vertical: array[37..40] of integer = (0, -20, 0, 20); // esquerda, cima, direita, baixo
begin
    if(Key < 37) or (Key > 40) then
         Exit;
    imgNave.Left := imgNave.Left + horizontal[Key];
    imgNave.Top := imgNave.Top + vertical[Key];
end;

end.

