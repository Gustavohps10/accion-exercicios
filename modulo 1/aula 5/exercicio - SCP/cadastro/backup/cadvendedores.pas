unit CadVendedores;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CadModelo;

type

  { TCadVendedoresF }

  TCadVendedoresF = class(TCadModeloF)
    edtCpfCnpj: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtIdVend: TEdit;
    edtNomeFantasia: TEdit;
    edtRazaoSocial: TEdit;
    edtTelefone: TEdit;
    edtPerComissao: TEdit;
    lblIdVend: TLabel;
    lblCpfCnpj: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblNomeFantasia: TLabel;
    lblRazaoSocial: TLabel;
    lblTelefone: TLabel;
    lblPerComissao: TLabel;
  private

  public

  end;

var
  CadVendedoresF: TCadVendedoresF;

implementation

{$R *.lfm}

end.

