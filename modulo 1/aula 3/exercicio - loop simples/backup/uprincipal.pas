unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnForDecrementa: TButton;
    btnWhile: TButton;
    btnFor: TButton;
    btnRepeat: TButton;
    procedure btnForClick(Sender: TObject);
    procedure btnRepeatClick(Sender: TObject);
    procedure btnWhileClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnWhileClick(Sender: TObject);
var numero: integer = 20;
begin
  while numero >= 0 do
  begin
       ShowMessage('numero: '+ inttostr(numero));
       numero := numero - 1
  end;
end;

procedure TprincipalF.btnForClick(Sender: TObject);
var i: integer = 0;
begin
     for i:=0 to 10 do
     begin
       ShowMessage('numero: '+ inttostr(i));
     end;
end;

procedure TprincipalF.btnRepeatClick(Sender: TObject);
var soma: integer;
begin
    soma := 0;
    repeat
         soma := soma +1;
         ShowMessage(IntToStr(soma));
    until ;
end;





end.

