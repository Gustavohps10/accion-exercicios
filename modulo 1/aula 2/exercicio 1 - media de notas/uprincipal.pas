unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  StrUtils,
  Math;

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
    pnlTopo: TPanel;
    procedure btnCalcularClick(Sender: TObject);
  private

  public

  end;

var
  PrincipalF: TPrincipalF;

const
  mediaAprovacao = 7;
  maxFaltas = 25;

implementation

{$R *.lfm}

{ TPrincipalF }

procedure TPrincipalF.btnCalcularClick(Sender: TObject);
var notas: array of double;
var faltas: integer;
var message: string;
begin
    notas := [StrToFloat(edtNota1.text),StrToFloat(edtNota2.text),StrToFloat(edtNota3.text),StrToFloat(edtNota4.text)];
    faltas := strtoint(edtFaltas.text);
    edtMedia.text := FloatToStr(Mean(notas));
    message := ifThen((faltas > maxFaltas) or (Mean(notas) < mediaAprovacao),'Reprovado','Aprovado');
    ShowMessage(message);
end;

end.

