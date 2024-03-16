unit uMoverImagem;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

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
var horizontal: array[37..40] of integer;
var vertical: array[37..40] of integer;
begin
    if(Key < 37) or (Key > 40) then
         Exit;
    horizontal[37] := -10; // esquerda
    horizontal[39] := 10; // direita
    horizontal[40] := 0; // baixo
    horizontal[38] := 0; // cima

    vertical[38] := -10; // cima
    vertical[40] := 10; // baixo
    vertical[39] := 0; //  direita
    vertical[37] := 0; // esquerda

    imgNave.Left := imgNave.left + horizontal[Key];
    imgNave.Top := imgNave.Top + vertical[Key];

end;

end.

