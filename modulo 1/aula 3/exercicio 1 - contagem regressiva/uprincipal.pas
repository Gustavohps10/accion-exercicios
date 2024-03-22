unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnContar: TButton;
    edtNumero1: TEdit;
    edtNumero2: TEdit;
    lnlNumero1: TLabel;
    lnlNumero2: TLabel;
    mmoContagem: TMemo;
    pnlTopo: TPanel;
    procedure btnContarClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnContarClick(Sender: TObject);
var n1, n2:integer;
begin
  mmoContagem.Clear;
  n1 := StrToIntDef(edtNumero1.text, 10);
  n2 := StrToIntDef(edtNumero2.text, 5);
  if n1 < n2 then
  begin
    ShowMessage('Número 1 é menor que o número 2');
    Exit;
  end;

  for n1:=n1 downto n2 do
  begin
       mmoContagem.Append(inttostr(n1));
  end;

end;

end.

