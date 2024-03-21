unit uPrimProg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ColorBox;

type

  { TfrmPrimProgr }

  TfrmPrimProgr = class(TForm)
    btnMensagem: TButton;
    btnSomar: TButton;
    edtN1: TEdit;
    edtN2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    pnlContainerSoma: TPanel;
    pnlTopo: TPanel;
    procedure btnMensagemClick(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
  private

  public

  end;

var
  frmPrimProgr: TfrmPrimProgr;

implementation

{$R *.lfm}

{ TfrmPrimProgr }

procedure TfrmPrimProgr.btnMensagemClick(Sender: TObject);
begin
  ShowMessage('Olá Eu Soun um Botão');
end;

procedure TfrmPrimProgr.btnSomarClick(Sender: TObject);
var n1, n2: Double;
begin
  n1 := StrToFloat(edtN1.text);
  n2 := StrToFloat(edtN2.text);
  Label2.Caption := '= ' + FloatToStr(n1+n2);
end;

end.

