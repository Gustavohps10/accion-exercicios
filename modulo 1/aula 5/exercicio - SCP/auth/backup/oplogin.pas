unit OpLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, MenuPrincipal;

type

  { TOpLoginF }

  TOpLoginF = class(TForm)
    edtEmail: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Image2: TImage;
    imgSair: TImage;
    lblSair: TLabel;
    lblEntrar: TLabel;
    lblEmail: TLabel;
    lblSenha: TLabel;
    pnlButtons: TPanel;
    pnlSair: TPanel;
    pnlGeralHeader: TPanel;
    pnlGeralFooter: TPanel;
    pnlImagem: TPanel;
    pnlBorder: TPanel;
    pnlBorder2: TPanel;
    pnlEmail: TPanel;
    pnlSenha: TPanel;
    pnlLogin: TPanel;
    pnlBarClient: TPanel;
    pnlLogo: TPanel;
    pnlGeral: TPanel;
    pnlLoginBar: TPanel;
    shpEntrar: TShape;
    shpSair: TShape;
    sbtEntrar: TSpeedButton;
    sbtSair: TSpeedButton;
    procedure sbtEntrarClick(Sender: TObject);
  private

  public

  end;

var
  OpLoginF: TOpLoginF;

implementation

{$R *.lfm}

{ TOpLoginF }

procedure TOpLoginF.sbtEntrarClick(Sender: TObject);
begin
    MenuPrincipalF := TMenuPrincipalF.Create(nil);
    MenuPrincipalF.Show();
    Hide;
end;

end.

