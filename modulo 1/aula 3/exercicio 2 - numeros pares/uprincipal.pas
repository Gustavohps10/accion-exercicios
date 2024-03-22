unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnLoop: TButton;
    mmoPares: TMemo;
    Panel1: TPanel;
    procedure btnLoopClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnLoopClick(Sender: TObject);
var i: integer = 0;
  var pares: array of integer;
begin
  mmoPares.Clear;
  while i < 10 do
  begin
      if i mod 2 = 0 then
      begin
        Insert(i, pares, -1);
        mmoPares.Append(IntToStr(i));
        if Length(pares) = 3 then
           Break;
      end;
      i := i+1;
  end;
end;

end.

