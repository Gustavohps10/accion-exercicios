unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Grids, Frame.Produto, FPHTTPClient, RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D, memds, fpjsondataset, DB, BufDataset, FPImage;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    FrameProduto1: TFrameProduto;
    Image1: TImage;
    dsProdutos: TJSONDataSet;
    pnlTitleProdutos: TPanel;
    pnlTopo: TPanel;
    pnlPrincipal: TPanel;
    pnlTotal: TPanel;
    ScrollBox1: TScrollBox;
    procedure FormShow(Sender: TObject);
  private
    procedure ListarProdutos();

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }
procedure TprincipalF.ListarProdutos();
var
  url: string = 'http://localhost:9000/products';
  LResponse: IResponse;
  frame: TFrameProduto;
  frameWidth: integer = 200;
  frameHeight: integer = 250;
  cols: integer = 3;
  gap: integer = 10;
  itemCount: integer = 0;
  topSpace: integer;
  leftSpace: integer;
  img: TImage;
begin
  topSpace := gap;
  leftSpace := gap;
   LResponse := TRequest.New.BaseURL(url)
   .Adapters(TDataSetSerializeAdapter.New(dsProdutos))
   .Accept('application/json')
   .Get;

  with dsProdutos do
  while not dsProdutos.EOF do
  begin
    itemCount := itemCount + 1;


      frame := TFrameProduto.Create(nil);
      frame.Top:= topSpace;
      frame.Left:=leftSpace;
      frame.Width:= frameWidth;
      frame.Height := frameHeight;
      frame.lblNomeProduto.Caption := FieldByName('name').AsString;
      frame.lblPrecoProduto.Caption := CurrToStr(FieldByName('price').AsCurrency);

      {Imagem}
      try
        img := TImage.Create(frame.imgFoto);
        //img.Parent := frame.imgFoto;
        img.Picture.LoadFromFile('./images/'+FieldByName('image').AsString);
        frame.imgFoto.Picture.Bitmap := img.Picture.Bitmap;
      finally
        img.Free;
      end;

      ScrollBox1.InsertControl(frame);

      frame.Free;


    {Espaçamento}
    leftSpace := leftSpace+ frameWidth + gap;
    if itemCount = cols then
    begin
        topSpace := topSpace + frameHeight + gap;
        leftSpace := gap;
        itemCount:=0;
    end;

    Next;
  end;

end;

procedure TprincipalF.FormShow(Sender: TObject);
begin
  ListarProdutos();
end;

end.

