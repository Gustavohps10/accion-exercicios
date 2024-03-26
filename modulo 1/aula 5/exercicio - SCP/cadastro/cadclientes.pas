unit CadClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadClientesF }

  TCadClientesF = class(TCadModeloF)
    edtEndereco: TEdit;
    edtNomeFantasia: TEdit;
    edtIdCadCli: TEdit;
    edtCpfCnpj: TEdit;
    edtTelefone: TEdit;
    edtRazaoSocial: TEdit;
    edtEmail: TEdit;
    lblEndereco: TLabel;
    lblNomeFantasia: TLabel;
    lblIdCadCli: TLabel;
    lblCpfCnpj: TLabel;
    lblTelefone: TLabel;
    lblRazaoSocial: TLabel;
    lblEmail: TLabel;
  private

  public

  end;

var
  CadClientesF: TCadClientesF;

implementation

{$R *.lfm}

end.

