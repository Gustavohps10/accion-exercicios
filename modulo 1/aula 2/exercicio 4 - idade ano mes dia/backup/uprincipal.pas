unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    edtIdadeDias: TEdit;
    lblAnoMesDia: TLabel;
    lblIdadeDias: TLabel;
    Panel1: TPanel;
    procedure edtIdadeDiasChange(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.edtIdadeDiasChange(Sender: TObject);
var idadeDias: integer;
var anos: integer;
var meses: integer;
var dias: integer;
begin
  idadeDias := StrToInt(edtIdadeDias.text);
  anos := idadeDias div 365;
  meses := idadeDias mod 365 div 30;
  dias := idadeDias mod 365 mod 30;
  lblAnoMesDia.Caption := 'Anos: ' + inttostr(anos) + '| Meses: '  + inttostr(meses) + '|Dias: ' + inttostr(dias);
end;

end.

