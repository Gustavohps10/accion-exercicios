unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, cadcliente, cadusuario;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    MainMenu1: TMainMenu;
    menuCadastro: TMenuItem;
    menuCadCliente: TMenuItem;
    menuCadUsuario: TMenuItem;
    procedure menuCadClienteClick(Sender: TObject);
    procedure menuCadUsuarioClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.menuCadClienteClick(Sender: TObject);
begin
    CadClienteF := CadCliente.Create(Self);
    CadClienteF.Show;
end;

procedure TprincipalF.menuCadUsuarioClick(Sender: TObject);
begin
     CadUsuarioF := CadUsuarioF.Create(Self);
    CadUsuarioF.Show;
end;

end.

