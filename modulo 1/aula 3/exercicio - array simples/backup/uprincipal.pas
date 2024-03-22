unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnMostrarFrutas: TButton;
    procedure btnMostrarFrutasClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnMostrarFrutasClick(Sender: TObject);
var frutas: array[0..4] of string = ('Banana', 'Mamão', 'Uva', 'Goiaba', 'Abacate');
begin
     ShowMessage(frutas[5]);
end;

end.

