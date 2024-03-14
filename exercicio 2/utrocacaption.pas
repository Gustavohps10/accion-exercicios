unit uTrocaCaption;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TfrmTrocaCaption }

  TfrmTrocaCaption = class(TForm)
    edtTrocaCaption: TEdit;
    Label1: TLabel;
    procedure edtTrocaCaptionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmTrocaCaption: TfrmTrocaCaption;

implementation

{$R *.lfm}

{ TfrmTrocaCaption }

procedure TfrmTrocaCaption.edtTrocaCaptionChange(Sender: TObject);
begin
  frmTrocaCaption.Caption := edtTrocaCaption.Text;
end;

procedure TfrmTrocaCaption.FormCreate(Sender: TObject);
begin

end;

end.

