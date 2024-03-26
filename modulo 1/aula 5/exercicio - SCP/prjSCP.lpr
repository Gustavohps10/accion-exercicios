program prjSCP;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MenuPrincipal, CadModelo, CadProdutos, CadClientes, CadUsuarios, 
cadvendedores,
  cadvendedores, CadVendedores, CadFornecedor
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.CreateForm(TCadProdutosF, CadProdutosF);
  Application.CreateForm(TCadClientesF, CadClientesF);
  Application.CreateForm(TCadUsuariosF, CadUsuariosF);
  Application.CreateForm(TCadFornecedorF, CadFornecedorF);
  Application.CreateForm(TCadVendedoresF, CadVendedoresF);
  Application.CreateForm(TCadVendedoresF, CadVendedoresF);
  Application.CreateForm(TCadFornecedorF, CadFornecedorF);
  Application.Run;
end.

