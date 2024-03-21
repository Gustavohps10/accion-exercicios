unit Calculadora;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmCalculadora }

  TfrmCalculadora = class(TForm)
    btnSomar: TButton;
    edtN1: TEdit;
    edtN2: TEdit;
    GroupBox1: TGroupBox;
    lblTotal: TLabel;
    lblSomaSimbolo: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure btnSomarClick(Sender: TObject);
  private

  public

  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.lfm}

{ TfrmCalculadora }

procedure TfrmCalculadora.btnSomarClick(Sender: TObject);
var n1, n2, total: Double;
begin
     n1 := StrToFloat(edtN1.text);
     n2 := StrToFloat(edtN2.text);
     total := n1 + n2;
     lblTotal.Caption := '= ' + FloatToStr(total);
end;

end.

end.

