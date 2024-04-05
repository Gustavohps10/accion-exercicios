unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids, ComCtrls, ExtCtrls, DBCtrls, BCMaterialDesignButton,
  ZDbcIntfs, ZDataset, dm;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnPrimeiro: TBCMaterialDesignButton;
    btnAnterior: TBCMaterialDesignButton;
    btnProximo: TBCMaterialDesignButton;
    btnUltimo: TBCMaterialDesignButton;
    btnSair: TBCMaterialDesignButton;
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
    imgEditar1: TImage;
    imgPrimeiro: TImage;
    imgAnterior: TImage;
    imgProximo: TImage;
    imgUltimo: TImage;
    imgSair: TImage;
    imgGravar: TImage;
    imgCancelar: TImage;
    imgExcluir: TImage;
    imgPesquisar: TImage;
    imgEditar: TImage;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    pnlBorderEdtPesquisa: TPanel;
    pnlCabecalho: TPanel;
    pnlPesquisaRodape: TPanel;
    pnlCadastroRodape: TPanel;
    qryCadProd: TZQuery;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryCadProdDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var DataAction: TDataAction);
    procedure qryCadProdNewRecord(DataSet: TDataSet);
  private

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

procedure TprincipalF.qryCadProdDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var DataAction: TDataAction);
begin
  try

  except

  end;
end;

procedure TprincipalF.qryCadProdNewRecord(DataSet: TDataSet);
begin
   with dmF.qryGenerica do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
    Open;
    qryCadProd.FieldByName('categoriaprodutoid').asInteger := FieldByName('CODIGO').AsInteger;
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
      try
        qryCadProd.Delete;
        PageControl1.ActivePage := tsPesquisa;
      except on E: EZSQLException do
             ShowMessage(E.message);
        if E.ErrorCode = 1451 then
          begin
          Application.MessageBox(PChar('Can not delete!'), 'Warning',
          mb_Ok or MB_ICONWARNING);
        end
      end;

    end;

end;

procedure TprincipalF.btnGravarClick(Sender: TObject);
begin
  qryCadProd.Post;
  qryCadProd.Refresh;
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

procedure TprincipalF.btnPesquisarClick(Sender: TObject);
var busca: string;
var query: string;
var id: integer;
begin
    busca := trim(edtPesquisar.text);
    if busca.IsEmpty then
       query := 'select * from categoria_produto';

    if not busca.IsEmpty and TryStrToInt(busca, id)
    then query := 'select * from categoria_produto where cast(categoriaprodutoid as text) ilike '+ QuotedStr('%'+busca+'%')+' or ds_categoria_produto ilike '+ QuotedStr('%'+busca+'%')+''
    else query := 'select * from categoria_produto where ds_categoria_produto ilike ' + QuotedStr('%'+busca+'%') +'';

    with qryCadProd do
    begin
      Close;
      SQL.Clear;
      SQL.Add(query);
      Open;

      if qryCadProd.RecordCount = 0 then
         ShowMessage('Nenhum registro encontrado');
    end;

end;

procedure TprincipalF.btnPrimeiroClick(Sender: TObject);
begin
  qryCadProd.First;
end;

procedure TprincipalF.btnUltimoClick(Sender: TObject);
begin
   qryCadProd.Last;
end;

procedure TprincipalF.btnAnteriorClick(Sender: TObject);
begin
  qryCadProd.Prior;
end;

procedure TprincipalF.btnProximoClick(Sender: TObject);
begin
  qryCadProd.Next;
end;

procedure TprincipalF.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

