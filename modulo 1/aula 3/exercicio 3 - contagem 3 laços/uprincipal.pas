unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  ExtCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnMostrarImpares: TButton;
    lblFor: TLabel;
    lblWhile: TLabel;
    lblRepeat: TLabel;
    mmoImpares1: TMemo;
    mmoImpares2: TMemo;
    mmoImpares3: TMemo;
    pnlTopo: TPanel;
    procedure btnMostrarImparesClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnMostrarImparesClick(Sender: TObject);
var i: integer = 0;
begin
   for i := i to 10 do
   begin

   end;

   while i < 10 do
   begin
       i := i + 1
   end;

   repeat
         i := i +1;
         if i mod 2 <> 0
    until i = 10 ;

end;

end.

