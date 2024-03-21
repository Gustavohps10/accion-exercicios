unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    edtTempoSegundos: TEdit;
    lblHorasMinutosSegundos: TLabel;
    lblTempoSegundos: TLabel;
    Panel1: TPanel;
    procedure edtTempoSegundosChange(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.edtTempoSegundosChange(Sender: TObject);
var tempoSegundos: integer;
var horas: integer;
var minutos: integer;
var segundos: integer;
var resto: integer;
begin
    tempoSegundos := StrToInt(edtTempoSegundos.text);
    horas := tempoSegundos div 3600; // 3600 segundos = 1 hora
    resto := tempoSegundos mod 3600;
    minutos := resto div 60;
    segundos := resto mod 60;
    lblHorasMinutosSegundos.Caption := 'Horas: ' + inttostr(horas) + ' | Minutos: '  + inttostr(minutos) + ' | Segundos: ' + inttostr(segundos);;
end;

end.

