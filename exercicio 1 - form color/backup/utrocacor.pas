unit uTrocaCor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ColorBox, StdCtrls;

type

  { TfrmMudarCor }

  TfrmMudarCor = class(TForm)
    ColorButton1: TColorButton;
    Label1: TLabel;

    procedure ColorButton1ColorChanged(Sender: TObject);
  private

  public

  end;

var
  frmMudarCor: TfrmMudarCor;

implementation

{$R *.lfm}

{ TfrmMudarCor }

procedure TfrmMudarCor.ColorButton1ColorChanged(Sender: TObject );
begin
   ShowMessage('test');
   frmMudarCor.Color := ColorButton1.ButtonColor;
end;



end.

