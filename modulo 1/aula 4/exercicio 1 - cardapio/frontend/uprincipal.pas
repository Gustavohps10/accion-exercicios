unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Grids, BCListBox, BGRAImageList, TASources, Frame.Produto,
  FPHTTPClient, RESTRequest4D, DataSet.Serialize.Adapter.RESTRequest4D, memds,
  fpjsondataset, DB, BufDataset, FPImage, BCMaterialDesignButton;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    Image1: TImage;
    dsProdutos: TJSONDataSet;
    imgTituloProdutos: TImage;
    lblTituloProdutos: TLabel;
    pnlProdutos: TPanel;
    pnlTitleProdutos: TPanel;
    pnlCabecalho: TPanel;
    pnlPrincipal: TPanel;
    pnlRodape: TPanel;
    pnlTotal: TPanel;
    sbProdutos: TScrollBox;
    procedure FormShow(Sender: TObject);

  private
    procedure ListarProdutos();
    procedure CliqueBotaoAdicionar(Sender: TObject);

  public


  end;

var
  principalF: TprincipalF;
  produtosSelecionados: array of integer;


implementation

{$R *.lfm}

{ TprincipalF }

 procedure TprincipalF.ListarProdutos();
var
  url: string = 'http://localhost:9000/products';
  LResponse: IResponse;
  frame: TFrameProduto;
  frameWidth: integer = 220;
  frameHeight: integer = 280;
  cols: integer = 4;
  gap: integer = 10;
  itemCount: integer = 0;
  topSpace: integer = 0;
  leftSpace: integer = 0;
  img: TImage;
begin

  TRequest.New.BaseURL(url)
   .Adapters(TDataSetSerializeAdapter.New(dsProdutos))
   .Accept('application/json')
   .Get;

  with dsProdutos do
  while not dsProdutos.EOF do
  begin
    itemCount := itemCount + 1;

    frame := TFrameProduto.Create(nil);
    frame.btnAdicionar.OnClick:= @CliqueBotaoAdicionar;
    frame.btnRemover.OnClick := @CliqueBotaoAdicionar;
    frame.btnAdicionar.Tag := strtoint(FieldByName('id').AsString);
    frame.btnRemover.Tag := strtoint(FieldByName('id').AsString);
    frame.Top:= topSpace;
    frame.Left:=leftSpace;
    frame.Width:= frameWidth;
    frame.Height := frameHeight;
    frame.lblNomeProduto.Caption := FieldByName('name').AsString;
    frame.lblPrecoProduto.Caption := CurrToStrF(FieldByName('price').AsCurrency, ffCurrency, 2);

    {Imagem}
    try
      img := TImage.Create(frame.imgFoto);
      //img.Parent := frame.imgFoto;
      img.Picture.LoadFromFile('./images/'+FieldByName('image').AsString);
      frame.imgFoto.Picture.Bitmap := img.Picture.Bitmap;
    finally
      img.Free;
    end;

    {Espaçamento}
    leftSpace := leftSpace+ frameWidth + gap;
    if itemCount = cols then
    begin
        topSpace := topSpace + frameHeight + gap;
        leftSpace := 0;
        itemCount:=0;
    end;
    pnlProdutos.InsertControl(frame);
    Next;
  end;

end;

procedure TprincipalF.FormShow(Sender: TObject);
begin
  ListarProdutos();
end;

procedure TprincipalF.CliqueBotaoAdicionar(Sender: TObject);
begin
  if Sender is TBCMaterialDesignButton then
     ShowMessage(inttostr(TButton(Sender).Tag));
end;

end.

