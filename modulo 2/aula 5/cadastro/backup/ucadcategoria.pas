unit ucadcategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ZDataset, uCadModelo;

type

  { TCadCategoriaF }

  TCadCategoriaF = class(TCadModeloF)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    lblID: TLabel;
    lblDesc: TLabel;
  private

  public

  end;

var
  CadCategoriaF: TCadCategoriaF;

implementation

{$R *.lfm}

end.
