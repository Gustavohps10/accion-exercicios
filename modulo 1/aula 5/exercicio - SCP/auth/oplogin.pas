unit OpLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, BCMaterialDesignButton, MenuPrincipal, CadEsqSenha;

type

  { TOpLoginF }

  TOpLoginF = class(TForm)
    btnSair: TBCMaterialDesignButton;
    btnEntrar: TBCMaterialDesignButton;
    edtEmail: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Image2: TImage;
    imgEntrar: TImage;
    imgSair1: TImage;
    lblEsqSenha: TLabel;
    lblEmail: TLabel;
    lblSenha: TLabel;
    pnlEsqSenha: TPanel;
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
    procedure btnEntrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure lblEsqSenhaClick(Sender: TObject);
    procedure lblEsqSenhaMouseEnter(Sender: TObject);
    procedure lblEsqSenhaMouseLeave(Sender: TObject);
  private

  public

  end;

var
  OpLoginF: TOpLoginF;

implementation

{$R *.lfm}

{ TOpLoginF }

procedure TOpLoginF.lblEsqSenhaClick(Sender: TObject);
begin
    CadEsqSenhaF := TCadEsqSenhaF.Create(Self);
    CadEsqSenhaF.Show();
end;

procedure TOpLoginF.btnSairClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TOpLoginF.btnEntrarClick(Sender: TObject);
begin
  MenuPrincipalF := TMenuPrincipalF.Create(nil);
  MenuPrincipalF.Show();
  Hide;
end;

procedure TOpLoginF.lblEsqSenhaMouseEnter(Sender: TObject);
begin
  lblEsqSenha.Font.Color := $00FFFFFF;
end;

procedure TOpLoginF.lblEsqSenhaMouseLeave(Sender: TObject);
begin
  lblEsqSenha.Font.Color := $00FFEBE6;
end;


end.

