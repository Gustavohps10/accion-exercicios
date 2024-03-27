unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, StdCtrls, CadProdutos, CadClientes, CadFornecedor, CadUsuarios,
  CadVendedores, OpSobre;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    Image1: TImage;
    imgSair: TImage;
    lblSair: TLabel;
    MainMenu1: TMainMenu;
    menuCadastro: TMenuItem;
    menuCadCliente: TMenuItem;
    menuCadProduto: TMenuItem;
    menuCadUsuario: TMenuItem;
    menuCadFornecedor: TMenuItem;
    menuCadVendedor: TMenuItem;
    menuSair: TMenuItem;
    menuSobre: TMenuItem;
    pnlHeader: TPanel;
    sbtSair: TSpeedButton;
    shpSair: TShape;
    procedure FormCreate(Sender: TObject);
    procedure menuCadClienteClick(Sender: TObject);
    procedure menuCadFornecedorClick(Sender: TObject);
    procedure menuCadProdutoClick(Sender: TObject);
    procedure menuCadUsuarioClick(Sender: TObject);
    procedure menuCadVendedorClick(Sender: TObject);
    procedure menuSairClick(Sender: TObject);
    procedure menuSobreClick(Sender: TObject);
    procedure sbtSairClick(Sender: TObject);
  private

  public

  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.lfm}

{ TMenuPrincipalF }

procedure TMenuPrincipalF.menuCadProdutoClick(Sender: TObject);
begin
    CadProdutosF := TCadProdutosF.Create(Self);
    CadProdutosF.Show();
end;

procedure TMenuPrincipalF.menuCadClienteClick(Sender: TObject);
begin
    CadClientesF := TCadClientesF.Create(Self);
    CadClientesF.Show();
end;

procedure TMenuPrincipalF.FormCreate(Sender: TObject);
begin

end;

procedure TMenuPrincipalF.menuCadUsuarioClick(Sender: TObject);
begin
    CadUsuariosF := TCadUsuariosF.Create(Self);
    CadUsuariosF.Show();
end;

procedure TMenuPrincipalF.menuCadFornecedorClick(Sender: TObject);
begin
    CadFornecedorF := TCadFornecedorF.Create(Self);
    CadFornecedorF.Show();
end;

procedure TMenuPrincipalF.menuCadVendedorClick(Sender: TObject);
begin
  CadVendedoresF := TCadVendedoresF.Create(Self);
  CadVendedoresF.Show();
end;

procedure TMenuPrincipalF.menuSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMenuPrincipalF.menuSobreClick(Sender: TObject);
begin
  OpSobreF := TOpSobreF.Create(Self);
  OpSobreF.Show();

end;

procedure TMenuPrincipalF.sbtSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

end.

