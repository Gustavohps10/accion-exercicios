unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  BCMaterialDesignButton, StrUtils;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnIgual: TBCMaterialDesignButton;
    btnPorcentagem: TBCMaterialDesignButton;
    btnLimpar: TBCMaterialDesignButton;
    btnApagar: TBCMaterialDesignButton;
    btnDividir: TBCMaterialDesignButton;
    btn7: TBCMaterialDesignButton;
    btn8: TBCMaterialDesignButton;
    btn9: TBCMaterialDesignButton;
    btnMultiplicar: TBCMaterialDesignButton;
    btn4: TBCMaterialDesignButton;
    btn5: TBCMaterialDesignButton;
    btn6: TBCMaterialDesignButton;
    btn1: TBCMaterialDesignButton;
    btn2: TBCMaterialDesignButton;
    btn3: TBCMaterialDesignButton;
    btnSubtrair: TBCMaterialDesignButton;
    btnAdicionar: TBCMaterialDesignButton;
    btnNegar: TBCMaterialDesignButton;
    btn0: TBCMaterialDesignButton;
    btnVirgula: TBCMaterialDesignButton;
    edtResultado: TEdit;
    imgIgual: TImage;
    imgApagar: TImage;
    imgDividir: TImage;
    imgMultiplicar: TImage;
    imgAdicionar: TImage;
    imgSubtrair: TImage;
    lblPadrao: TLabel;
    Label2: TLabel;

    procedure btnApagarClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnOperacaoClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnNegarClick(Sender: TObject);
    procedure btnNumeroClick(Sender: TObject);
  private

  public

  end;

var
  principalF: TprincipalF;
  operacao: string;
  valorAnterior: double;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.btnNumeroClick(Sender: TObject);
begin
   if Sender is TBCMaterialDesignButton then
   begin
     if (TBCMaterialDesignButton(Sender).Caption = ',') and ContainsText(edtResultado.Text, ',') then Exit;

     if (Trim(edtResultado.Text) = '') or (StrToFloat(edtResultado.Text) = 0)
     then edtResultado.Text := TBCMaterialDesignButton(Sender).Caption
     else edtResultado.Text := edtResultado.Text + TBCMaterialDesignButton(Sender).Caption;

   end;
end;

procedure TprincipalF.btnLimparClick(Sender: TObject);
begin
    edtResultado.Text := '0';
end;

procedure TprincipalF.btnApagarClick(Sender: TObject);
var valor: string;
begin
   valor := edtResultado.Text;
   if Length(valor) = 1
   then valor := '0'
   else SetLength(valor, Length(valor) - 1);

   edtResultado.Text := valor;
end;

procedure TprincipalF.btnIgualClick(Sender: TObject);
var resultado: double;
begin
  case operacao of
     'btnAdicionar': resultado := valorAnterior + StrToFloat(edtResultado.Text);
     'btnSubtrair': resultado := valorAnterior - StrToFloat(edtResultado.Text);
     'btnMultiplicar': resultado := valorAnterior * StrToFloat(edtResultado.Text);
     'btnDividir': resultado := valorAnterior / StrToFloat(edtResultado.Text);
  end;

  edtResultado.Text := FloatToStr(resultado);
end;

procedure TprincipalF.btnOperacaoClick(Sender: TObject);
begin
   if Sender is TBCMaterialDesignButton then
   begin
       valorAnterior := StrToFloat(edtResultado.Text);
       operacao := TBCMaterialDesignButton(Sender).Name;
       edtResultado.Text := '0';
   end;
end;

procedure TprincipalF.btnNegarClick(Sender: TObject);
begin
   edtResultado.Text := FloatToStr(-StrToFloat(edtResultado.Text));
end;

end.

