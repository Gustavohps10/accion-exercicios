unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
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
     procedure escreverImparNoMemo(numero: Integer; memo: TMemo);
  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnMostrarImparesClick(Sender: TObject);
var i: integer = 0;
begin
   mmoImpares1.Clear;
   mmoImpares2.Clear;
   mmoImpares3.Clear;

   for i := i to 10 do
   begin
      escreverImparNoMemo(i, mmoImpares1);
   end;

   i := 0;
   while i < 10 do
   begin
       escreverImparNoMemo(i, mmoImpares2);
       i := i + 1
   end;

   i := 0;
   repeat
         escreverImparNoMemo(i, mmoImpares3);
         i := i + 1;
   until i = 10 ;
end;

procedure TprincipalF.escreverImparNoMemo(numero: integer; memo: TMemo);
begin
   if numero mod 2 <> 0 then
   begin
      memo.Append(inttostr(numero));
   end;
end;

end.

