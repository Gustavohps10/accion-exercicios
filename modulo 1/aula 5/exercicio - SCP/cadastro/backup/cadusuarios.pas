unit CadUsuarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadUsuariosF }

  TCadUsuariosF = class(TCadModeloF)
    edtNomeUsuario: TEdit;
    edtCpfCnpj: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtIdCadUsu: TEdit;
    edtNomeFantasia: TEdit;
    edtSenha: TEdit;
    edtRazaoSocial: TEdit;
    edtTelefone: TEdit;
    lblNomeUsuario: TLabel;
    lblCpfCnpj: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblIdCadUsu: TLabel;
    lblNomeFantasia: TLabel;
    lblSenha: TLabel;
    lblRazaoSocial: TLabel;
    lblTelefone: TLabel;
  private

  public

  end;

var
  CadUsuariosF: TCadUsuariosF;

implementation

{$R *.lfm}

end.

