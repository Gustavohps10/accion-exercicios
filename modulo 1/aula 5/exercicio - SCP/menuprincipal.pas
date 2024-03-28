unit MenuPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  Buttons, StdCtrls, BCMaterialDesignButton, CadProdutos, CadClientes,
  CadFornecedor, CadUsuarios, CadVendedores, OpSobre;

type

  { TMenuPrincipalF }

  TMenuPrincipalF = class(TForm)
    btnSair: TBCMaterialDesignButton;
    imgLogo: TImage;
    imgSair1: TImage;
    MainMenu1: TMainMenu;
    menuCadastro: TMenuItem;
    menuCadCliente: TMenuItem;
    menuCadProduto: TMenuItem;
    menuCadUsuario: TMenuItem;
    menuCadFornecedor: TMenuItem;
    menuCadVendedor: TMenuItem;
    menuSobre: TMenuItem;
    pnlHeader: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuCadClienteClick(Sender: TObject);
    procedure menuCadFornecedorClick(Sender: TObject);
    procedure menuCadProdutoClick(Sender: TObject);
    procedure menuCadUsuarioClick(Sender: TObject);
    procedure menuCadVendedorClick(Sender: TObject);
    procedure menuSobreClick(Sender: TObject);
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

procedure TMenuPrincipalF.btnSairClick(Sender: TObject);
begin
    Close;
    Application.Terminate;
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

procedure TMenuPrincipalF.menuSobreClick(Sender: TObject);
begin
  OpSobreF := TOpSobreF.Create(Self);
  OpSobreF.Show();

end;

end.

