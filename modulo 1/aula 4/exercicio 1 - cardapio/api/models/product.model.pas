unit Product.Model;

{$mode ObjFPC}{$H+}

interface
         type
           TProduct = class
             private
               FName: string;
               FDescription: string;
               FImage: string;
               FPrice: Double;
             public
               property Name: string read FName write FName;
               property Description: string read FDescription write FDescription;
               property Image: string read FImage write FImage;
               property Price: Double read FPrice write FPrice;
               procedure Save();
         end;

implementation

procedure TProduct.Save();
begin
  WriteLn(Self.Description);
  //Salvar no Banco de dados
end;

end.

