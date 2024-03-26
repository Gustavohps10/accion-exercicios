unit cadCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadClienteF }

  TCadClienteF = class(TForm)
    btnFechar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  CadClienteF: TCadClienteF;

implementation

{$R *.lfm}

{ TCadClienteF }

procedure TCadClienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:=caFree;
end;

procedure TCadClienteF.btnFecharClick(Sender: TObject);
begin
   Close;
end;

end.

