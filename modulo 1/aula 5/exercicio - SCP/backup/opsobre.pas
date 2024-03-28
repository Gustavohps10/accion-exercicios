unit OpSobre;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TOpSobreF }

  TOpSobreF = class(TForm)
    Image1: TImage;
    Image2: TImage;
    lblDB: TLabel;
    lblLinguagem: TLabel;
    lblVersion: TLabel;
    pnlTopo: TPanel;
    txtPrincipal: TStaticText;
    txtDireitosReservados: TStaticText;
    txtFeitoPor: TStaticText;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  OpSobreF: TOpSobreF;

implementation

{$R *.lfm}

{ TOpSobreF }

procedure TOpSobreF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := caFree;
end;

end.

