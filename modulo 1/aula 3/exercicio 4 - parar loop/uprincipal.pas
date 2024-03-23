unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnLoop: TButton;
    lblFor: TLabel;
    lblWhile: TLabel;
    lblRepeat: TLabel;
    mmoLoop1: TMemo;
    mmoLoop2: TMemo;
    mmoLoop3: TMemo;
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
begin
   mmoLoop1.Clear;
   mmoLoop2.Clear;
   mmoLoop3.Clear;

   for i := i to 10 do
   begin
      mmoLoop1.Append(inttostr(i));
      if i = 5 then Break;
   end;

   i := 0;
   while i < 10 do
   begin
      mmoLoop2.Append(inttostr(i));
      if i = 5 then Break;
      i := i + 1
   end;

   i := 0;
   repeat
         mmoLoop3.Append(inttostr(i));
         if i = 5 then Break;
         i := i + 1;
   until i = 10 ;
end;

end.

