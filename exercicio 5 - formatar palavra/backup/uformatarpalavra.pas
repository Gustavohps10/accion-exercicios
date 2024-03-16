unit uFormatarPalavra;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmFormatarTexto }

  TfrmFormatarTexto = class(TForm)
    btnMaiusculo: TButton;
    btnMinusculo: TButton;
    btnPrimeiraMaiuscula: TButton;
    btnPrimeiraMinuscula: TButton;
    edtTexto: TEdit;
    lblTexto: TLabel;
    procedure btnMaiusculoClick(Sender: TObject);
    procedure btnMinusculoClick(Sender: TObject);
    procedure btnPrimeiraMaiusculaClick(Sender: TObject);
    procedure btnPrimeiraMinusculaClick(Sender: TObject);
  private

  public

  end;

var
  frmFormatarTexto: TfrmFormatarTexto;

implementation

{$R *.lfm}

{ TfrmFormatarTexto }

procedure TfrmFormatarTexto.btnMaiusculoClick(Sender: TObject);
begin
  edtTexto.Text := UpperCase(edtTexto.Text);
end;

procedure TfrmFormatarTexto.btnMinusculoClick(Sender: TObject);
begin
  edtTexto.Text := LowerCase(edtTexto.Text);
end;

procedure TfrmFormatarTexto.btnPrimeiraMaiusculaClick(Sender: TObject);
begin
  edtTexto.Text := Uppercase(Copy(edtTexto.Text,1,1)) + Lowercase(Copy(edtTexto.Text,2,Length(edtTexto.Text)));
end;

procedure TfrmFormatarTexto.btnPrimeiraMinusculaClick(Sender: TObject);
begin
   edtTexto.Text := AnsiLowerCase(edtTexto.Text);
end;

end.

