unit OpLogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, MenuPrincipal, CadEsqSenha;

type

  { TOpLoginF }

  TOpLoginF = class(TForm)
    edtEmail: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    imgSair: TImage;
    lblEsqSenha: TLabel;
    lblSair: TLabel;
    lblEntrar: TLabel;
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
    shpEntrar: TShape;
    shpSair: TShape;
    sbtEntrar: TSpeedButton;
    sbtSair: TSpeedButton;
    procedure lblEsqSenhaClick(Sender: TObject);
    procedure lblEsqSenhaMouseEnter(Sender: TObject);
    procedure lblEsqSenhaMouseLeave(Sender: TObject);
    procedure sbtEntrarClick(Sender: TObject);
    procedure sbtSairClick(Sender: TObject);
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

procedure TOpLoginF.lblEsqSenhaClick(Sender: TObject);
begin
    CadEsqSenhaF := TCadEsqSenhaF.Create(Self);
    CadEsqSenhaF.Show();
end;

procedure TOpLoginF.lblEsqSenhaMouseEnter(Sender: TObject);
begin
  lblEsqSenha.Font.Color := $00FFFFFF;
end;

procedure TOpLoginF.lblEsqSenhaMouseLeave(Sender: TObject);
begin
  lblEsqSenha.Font.Color := $00FFEBE6;
end;

procedure TOpLoginF.sbtSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

