unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TPrincipalF }

  TPrincipalF = class(TForm)
    btnCalcular: TButton;
    edtFaltas: TEdit;
    edtMedia: TEdit;
    edtNota1: TEdit;
    edtNota2: TEdit;
    edtNota3: TEdit;
    edtNota4: TEdit;
    lblFaltas: TLabel;
    lblMedia: TLabel;
    lblNota1: TLabel;
    lblNota2: TLabel;
    lblNota3: TLabel;
    lblNota4: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private

  public
     function calculaMedia(notas: array of double): double;

  end;

var
  PrincipalF: TPrincipalF;

const
  mediaAprovacao = 7;
  maxFalta = 25;

implementation

{$R *.lfm}

{ TPrincipalF }

procedure TPrincipalF.btnCalcularClick(Sender: TObject);
var notas: array of double;
var media: double;
var faltas: integer;
begin
    faltas := strtoint(edtFaltas.text);
    notas := [
          StrToFloat(edtNota1.text),
          StrToFloat(edtNota2.text),
          StrToFloat(edtNota3.text),
          StrToFloat(edtNota4.text)];
    media := calculaMedia(notas);
    edtMedia.text := FloatToStr(media);

    if (faltas > maxFalta) or (media < mediaAprovacao) then
    begin
      ShowMessage('Reprovado');
      Exit;
    end;

    ShowMessage('Aprovado');
end;

function TprincipalF.calculaMedia(notas: array of Double): Double;
var totalNotas: double = 0;
var nota: double;
begin
    for nota in notas do
    begin
       totalNotas := totalNotas + nota;
    end;

    Result := totalNotas / Length(notas);
end;


end.

