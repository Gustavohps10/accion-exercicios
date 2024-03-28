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
  Forms, MenuPrincipal, CadModelo, CadProdutos, CadUsuarios,
   CadVendedores, CadFornecedor, OpLogin, OpSobre, CadEsqSenha, CadClientes
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TOpLoginF, OpLoginF);
  Application.CreateForm(TCadModeloF, CadModeloF);
  Application.CreateForm(TCadClientesF, CadClientesF);
  Application.Run;
end.

