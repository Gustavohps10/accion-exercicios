unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Frame.Produto, FPHTTPClient, RESTRequest4D, DataSet.Serialize, fpjson, jsonparser,
  memds;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    FrameProduto1: TFrameProduto;
    Image1: TImage;
    ListView1: TListView;
    MemDataset: TMemDataset;
    pnlTopo: TPanel;
    pnlPrincipal: TPanel;
    pnlTotal: TPanel;
    procedure FormShow(Sender: TObject);
  private
    procedure ListarProdutos();

  public

  end;

var
  principalF: TprincipalF;
  Produtos: TJSONArray;

implementation

{$R *.lfm}

{ TprincipalF }
procedure TprincipalF.ListarProdutos();
  var url: string = 'http://localhost:9000/products';
  var jsonData: TJSONData;
  var produto: TJSONObject;
  var LResponse: IResponse;
begin
     LResponse := TRequest.New.BaseURL(url)
    .Accept('application/json')
    .DataSetAdapter(MemDataset)
    .Get;
  if LResponse.StatusCode = 200 then
    jsonData := GetJSON(LResponse.Content);
  Produtos := jsonData as TJSONArray;


end;

procedure TprincipalF.FormShow(Sender: TObject);
begin
  ListarProdutos();
end;

end.

