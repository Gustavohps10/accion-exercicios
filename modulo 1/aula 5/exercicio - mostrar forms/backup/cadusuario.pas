unit cadusuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCadUsuarioF }

  TCadUsuarioF = class(TForm)
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  CadUsuarioF: TCadUsuarioF;

implementation

{$R *.lfm}

{ TCadUsuarioF }

procedure TCadUsuarioF.FormCreate(Sender: TObject);
begin

end;

end.
