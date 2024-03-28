unit CadClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadClientesF }

  TCadClientesF = class(TCadModeloF)
    edtCpfCnpj: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtIdCadCli: TEdit;
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    edtTelefone: TEdit;
    lblCpfCnpj: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblIdCadCli: TLabel;
    lblNomeFantasia: TLabel;
    lblRazaoSocial: TLabel;
    lblTelefone: TLabel;
  private

  public

  end;

var
  CadClientesF: TCadClientesF;

implementation

{$R *.lfm}

end.

