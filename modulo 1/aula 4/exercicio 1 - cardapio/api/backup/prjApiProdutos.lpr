program prjApiProdutos;

{$MODE DELPHI}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Horse, Horse.Jhonson, SysUtils, fpjson, fpjsonrtti, jsonparser, Product.Model, Product.Controller;

procedure CreateProducts(Req: THorseRequest; Res: THorseResponse);
var
  LBody: TJSONObject;
begin
  LBody := Req.Body<TJSONObject>;
  Res.Send<TJSONObject>(LBody);
end;

procedure ListProducts(Req: THorseRequest; Res: THorseResponse);
  var Products: TJSONArray;
  var jsonData: TJSONData;
begin
  jsonData := GetJSON('['+
  '{"id":1,"name":"Cachorro Quente","price":12,"image":"cachorro-quente.png"},'+
  '{"id":2,"name":"Bauru Simples","price":13,"image":"bauru-simples.png"},'+
  '{"id":3,"name":"Bauru com Ovo","price":15,"image":"bauru-com-ovo.png"},'+
  '{"id":4,"name":"Hambúrguer","price":12,"image":"hamburguer.png"},'+
  '{"id":5,"name":"Cheeseburguer","price":13,"image":"cheeseburguer.png"},'+
  '{"id":6,"name":"X-Salada","price":14.50,"image":"x-salada.png"}'+
  '{"id":7,"name":"Coca-Cola Lata","price":6.50,"image":"coca-cola-lata.png"}'+
  '{"id":8,"name":"Sprite Lata","price":6.00,"image":"sprite-lata.png"}'+
  '{"id":9,"name":"Suco de laranja","price":4.40,"image":"suco-de-laranja.png"}'+
  '{"id":10,"name":"Chocolate MM","price":3.50,"image":"chocolate-mm.png"}'+
  ']');
  Products := jsonData as TJSONArray;
  Res.Send<TJSONArray>(Products);
end;

begin
  THorse.Use(Jhonson);
  THorse.Post('/products', CreateProducts);
  THorse.Get('/products', ListProducts);
  THorse.Listen(9000);
end.
