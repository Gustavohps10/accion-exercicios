unit CadFornecedor;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadModeloF1 }

  TCadModeloF1 = class(TCadModeloF)
    edtCpfCnpj: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtIdCadFornec: TEdit;
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    edtTelefone: TEdit;
    lblCpfCnpj: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblIdCadFornec: TLabel;
    lblNomeFantasia: TLabel;
    lblRazaoSocial: TLabel;
    lblTelefone: TLabel;
  private

  public

  end;

var
  CadModeloF1: TCadModeloF1;

implementation

{$R *.lfm}

end.

