unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnCalcular: TButton;
    edtMedia: TEdit;
    edtPessoa1: TEdit;
    edtPessoa2: TEdit;
    edtPessoa3: TEdit;
    edtPessoa4: TEdit;
    lblMedia: TLabel;
    lblPessoa1: TLabel;
    lblPessoa2: TLabel;
    lblPessoa3: TLabel;
    lblPessoa4: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private

  public
    function calculaMedia(idades: array of double): double;

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnCalcularClick(Sender: TObject);
var idades: array of double;
begin
    idades := [
          StrToFloat(edtPessoa1.text),
          StrToFloat(edtPessoa2.text),
          StrToFloat(edtPessoa3.text),
          StrToFloat(edtPessoa4.text),
          2
          ];
    edtMedia.text := FloatToStr(calculaMedia(idades));
end;

function TprincipalF.calculaMedia(idades: array of Double): Double;
var totalIdades: double = 0;
var idade: double;
begin
    for idade in idades do
    begin
       totalIdades := totalIdades + idade;
    end;

    Result := totalIdades / Length(idades);
end;


end.

