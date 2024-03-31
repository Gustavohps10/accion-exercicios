unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, CheckBoxThemed, BCListBox, Frame.Produto, RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, memds, fpjsondataset, DB, BufDataset,
  FPImage, BCMaterialDesignButton, BGRAThemeCheckBox;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    btnTotalBackground: TBCMaterialDesignButton;
    cbEmbalagem: TBGRAThemeCheckBox;
    Image1: TImage;
    dsListaProdutos: TJSONDataSet;
    imgTituloProdutos: TImage;
    lblEmbalagemPreco: TLabel;
    lblTotal: TLabel;
    lblTituloProdutos: TLabel;
    dsProdutosSelecionados: TMemDataset;
    lblTotalValor: TLabel;
    pnlTotal: TPanel;
    pnlContainerProdutos: TPanel;
    pnlListaProdutos: TPanel;
    pnlTitleProdutos: TPanel;
    pnlCabecalho: TPanel;
    pnlPrincipal: TPanel;
    pnlRodape: TPanel;
    pnlLateral: TPanel;
    sbConteudo: TScrollBox;
    procedure cbEmbalagemChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure AtualizaTotalPedido(idProduto: integer; quantidadeAdicionada: integer);
    procedure ListarProdutos();
    procedure CliqueBotaoAdicionar(Sender: TObject);
    procedure CliqueBotaoRemover(Sender: TObject);

  public


  end;

var
  principalF: TprincipalF;
  totalPedido: Double = 0;
  valorProdutoSelecionado: Double;

implementation

{$R *.lfm}

{ TprincipalF }

 procedure TprincipalF.ListarProdutos();
var
  url: string = 'http://localhost:9000/products';
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
   .Adapters(TDataSetSerializeAdapter.New(dsListaProdutos))
   .Accept('application/json')
   .Get;

  with dsListaProdutos do
  begin
    while not dsListaProdutos.EOF do
    begin
      itemCount := itemCount + 1;

      dsProdutosSelecionados.Open;
      dsProdutosSelecionados.Append;
      dsProdutosSelecionados.FieldByName('id').AsInteger := FieldByName('id').AsInteger;
      dsProdutosSelecionados.FieldByName('quantidade').AsInteger := 0;
      dsProdutosSelecionados.FieldByName('preco').AsFloat := FieldByName('price').AsFloat;
      dsProdutosSelecionados.Post;

      {Novo frame}
      frame := TFrameProduto.Create(nil);
      frame.btnAdicionar.OnClick:= @CliqueBotaoAdicionar;
      frame.btnRemover.OnClick := @CliqueBotaoRemover;
      frame.btnAdicionar.Tag := FieldByName('id').AsInteger;
      frame.btnRemover.Tag := FieldByName('id').AsInteger;
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
      pnlListaProdutos.InsertControl(frame);
      Next;
    end;
  end;
  //dsProdutosSelecionados.First;
end;

procedure TprincipalF.FormShow(Sender: TObject);
begin
  ListarProdutos();
end;

procedure TprincipalF.cbEmbalagemChange(Sender: TObject);
begin
  if cbEmbalagem.Checked
  then totalPedido := totalPedido + 4
  else totalPedido := totalPedido - 4;
  lblTotalValor.Caption := FloatToStrF(totalPedido, ffCurrency, 8,2);
end;

procedure TprincipalF.AtualizaTotalPedido(idProduto: integer; quantidadeAdicionada: integer);
begin
    totalPedido := 0;
    with dsProdutosSelecionados do
    begin
      Open;
      First;
      while not EOF do
      begin
        if FieldByName('id').AsInteger = idProduto  then
        begin
          Edit;
          FieldByName('quantidade').AsInteger := FieldByName('quantidade').AsInteger + quantidadeAdicionada;
          Post;

          valorProdutoSelecionado := FieldByName('preco').AsFloat;
        end;
        totalPedido := totalPedido + (FieldByName('preco').AsFloat * FieldByName('quantidade').AsInteger) ;
        Next;
       end;
       Close;
    end;

    if cbEmbalagem.Checked then
      totalPedido := totalPedido + 4;

    lblTotalValor.Caption := FloatToStrF(totalPedido, ffCurrency, 8,2);
end;

procedure TprincipalF.CliqueBotaoAdicionar(Sender: TObject);
var
  id: integer;
  frame: TFrameProduto;
  qtdAtual: integer;
begin
  if Sender is TBCMaterialDesignButton then
  begin
    id:= TBCMaterialDesignButton(Sender).Tag;
    frame := (TBCMaterialDesignButton(Sender).Parent as TFrameProduto);
    AtualizaTotalPedido(id, 1);

    {Atualiza quantidade no frame}
    qtdAtual := strtoint(frame.lblQuantidadeValor.Caption);
    qtdAtual := qtdAtual + 1;
    frame.lblQuantidadeValor.Caption := IntToStr(qtdAtual);

    {Atualiza subtotal no frame}
    frame.lblSubtotal.Caption := 'Subtotal: ' + FloatToStrF(qtdAtual*valorProdutoSelecionado, ffCurrency, 8,2);
  end;
end;

procedure TprincipalF.CliqueBotaoRemover(Sender: TObject);
var
  id: integer;
  frame: TFrameProduto;
  qtdAtual: integer;
begin
  if Sender is TBCMaterialDesignButton then
  begin
    id:= TBCMaterialDesignButton(Sender).Tag;
    frame := (TBCMaterialDesignButton(Sender).Parent as TFrameProduto);

    {Atualiza quantidade no frame}
    qtdAtual := strtoint(frame.lblQuantidadeValor.Caption);

    if(qtdAtual = 0) then Exit;

    qtdAtual := qtdAtual - 1;
    frame.lblQuantidadeValor.Caption := IntToStr(qtdAtual);
    AtualizaTotalPedido(id, -1);

    {Atualiza subtotal no frame}
    frame.lblSubtotal.Caption := 'Subtotal: ' + FloatToStrF(qtdAtual*valorProdutoSelecionado, ffCurrency, 8,2);
  end;
end;

end.

