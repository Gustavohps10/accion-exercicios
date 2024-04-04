unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids, ComCtrls, ExtCtrls, DBCtrls, BCMaterialDesignButton,
  ZDataset, dm;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnPesquisar: TBCMaterialDesignButton;
    btnNovo: TBCMaterialDesignButton;
    btnEditar: TBCMaterialDesignButton;
    btnGravar: TBCMaterialDesignButton;
    btnCancelar: TBCMaterialDesignButton;
    btnExcluir: TBCMaterialDesignButton;
    DataSource1: TDataSource;
    dbEdtID: TDBEdit;
    dbEdtDesc: TDBEdit;
    edtPesquisar: TEdit;
    grdCategorias: TDBGrid;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    pnlCabecalho: TPanel;
    pnlPesquisaRodape: TPanel;
    pnlCadastroRodape: TPanel;
    qryCadProd: TZQuery;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryCadProdNewRecord(DataSet: TDataSet);
  private
    function IsStrANumber(const S: string): Boolean;
  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.FormCreate(Sender: TObject);
begin
  //qryCadProd.Open;
end;

procedure TprincipalF.qryCadProdNewRecord(DataSet: TDataSet);
begin
   with dmF.qryGenerica do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
    Open;
    FieldByName('categoriaprodutoid').asInteger := dmF.qryGenerica.FieldByName('CODIGO').AsInteger;
   end;
end;

procedure TprincipalF.btnEditarClick(Sender: TObject);
begin
   with qryCadProd do
   begin
     Edit;
     FieldByName('ds_categoria_produto').AsString:= dbEdtDesc.Text;
     Post;
   end;
   PageControl1.ActivePage := tsPesquisa;
end;

procedure TprincipalF.btnCancelarClick(Sender: TObject);
begin
  qryCadProd.Cancel;
  PageControl1.ActivePage := tsPesquisa;
end;

procedure TprincipalF.btnExcluirClick(Sender: TObject);
begin
    If  MessageDlg('Deseja excluir o registro?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
        qryCadProd.Delete;
        PageControl1.ActivePage := tsPesquisa;
    end;
end;

procedure TprincipalF.btnGravarClick(Sender: TObject);
begin
  qryCadProd.Post;
  PageControl1.ActivePage := tsPesquisa;
end;

procedure TprincipalF.btnNovoClick(Sender: TObject);
begin
    PageControl1.ActivePage := tsCadastro;
    with qryCadProd do
    begin
      Insert;
    end;
end;

function TprincipalF.IsStrANumber(const S: string): Boolean;
begin
  Result := True;
  try
    StrToInt(S);
  except
    Result := False;
  end;
end;

procedure TprincipalF.btnPesquisarClick(Sender: TObject);
var busca: string;
var query: string;
begin
    busca := trim(edtPesquisar.text);
    if busca.IsEmpty then
       Exit;

    if isN
    then query := 'select * from categoria_produto where categoriaprodutoid='+ QuotedStr(busca) +''
    else query := 'select * from categoria_produto where ds_categoria_produto=' + QuotedStr(busca) +'';

    with qryCadProd do
    begin
      Close;
      SQL.Clear;
      SQL.Add(query);
      Open;
    end;
end;

end.

