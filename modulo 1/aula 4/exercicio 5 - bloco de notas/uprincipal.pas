unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  FileCtrl, PrintersDlgs, StrUtils, Printers;

type

  { TprincipalF }

  TprincipalF = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    mmoPrincipal: TMemo;
    menuArquivo: TMenuItem;
    menuLocalizar: TMenuItem;
    menuSubstituir: TMenuItem;
    menuFonte: TMenuItem;
    menuEditar: TMenuItem;
    menuFormatar: TMenuItem;
    menuNovo: TMenuItem;
    menuAbrir: TMenuItem;
    menuSalvar: TMenuItem;
    menuImprimir: TMenuItem;
    OpenDialog1: TOpenDialog;
    PrintDialog1: TPrintDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    procedure FindDialog1Find(Sender: TObject);
    procedure FontDialog1ApplyClicked(Sender: TObject);
    procedure menuAbrirClick(Sender: TObject);
    procedure menuFonteClick(Sender: TObject);
    procedure menuImprimirClick(Sender: TObject);
    procedure menuLocalizarClick(Sender: TObject);
    procedure menuNovoClick(Sender: TObject);
    procedure menuSalvarClick(Sender: TObject);
    procedure menuSubstituirClick(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
  private
     FSelPos: integer;

  public

  end;

var
  principalF: TprincipalF;

implementation

{$R *.lfm}

{ TprincipalF }

procedure TprincipalF.menuNovoClick(Sender: TObject);
begin
   mmoPrincipal.Clear;
end;

procedure TprincipalF.menuAbrirClick(Sender: TObject);
begin
      OpenDialog1.Execute;
      mmoPrincipal.Lines.LoadFromFile(OpenDialog1.FileName)
end;

procedure TprincipalF.menuImprimirClick(Sender: TObject);
var
  I,
  Line : Integer;
begin
  PrintDialog1.execute;
  I := 0;
  Line := 0 ;
  Printer.BeginDoc ;
  for I := 0 to mmoPrincipal.Lines.Count - 1 do begin
    Printer.Canvas.TextOut(0, Line, mmoPrincipal.Lines[I]);
    Line := Line + Abs(Printer.Canvas.Font.Height);
    if (Line >= Printer.PageHeight) then
      Printer.NewPage;
  end;
  Printer.EndDoc;
end;

procedure TprincipalF.FindDialog1Find(Sender: TObject);
var
  S : string;
  startpos : integer;
begin
  with TFindDialog(Sender) do
  begin

    if FSelPos = 0 then
      Options := Options - [frFindNext];

    if frfindNext in Options then
    begin
      StartPos := FSelPos + Length(Findtext);
      S := Copy(mmoPrincipal.Lines.Text, StartPos, MaxInt);
    end
    else
    begin
      S := mmoPrincipal.Lines.Text;
      StartPos := 1;
    end;
    FSelPos := Pos(FindText, S);
    if FSelPos > 0 then
    begin
      FSelPos := FSelPos + StartPos - 1;
      mmoPrincipal.SelStart := FSelPos - 1;
      mmoPrincipal.SelLength := Length(FindText);
      mmoPrincipal.SetFocus;
    end
    else
    begin
      if frfindNext in Options then
        S := Concat('There are no further occurences of "', FindText,
          '" in mmoPrincipal.')
      else
        S := Concat('Could not find "', FindText, '" in mmoPrincipal.');
      MessageDlg(S, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TprincipalF.menuLocalizarClick(Sender: TObject);
begin
  FSelPos := 0;
  FindDialog1.Execute;
end;

procedure TprincipalF.menuSalvarClick(Sender: TObject);
begin
      SaveDialog1.Execute;
      mmoPrincipal.Lines.SaveToFile(SaveDialog1.FileName)
end;

procedure TprincipalF.menuSubstituirClick(Sender: TObject);
begin
     ReplaceDialog1.Execute;
end;

procedure TprincipalF.ReplaceDialog1Replace(Sender: TObject);
var
  SelPos: Integer;

begin
  with TReplaceDialog(Sender) do
  begin
    SelPos := Pos(FindText, mmoPrincipal.Lines.Text);
    if SelPos > 0 then
    begin
      mmoPrincipal.SelStart := SelPos - 1;
      mmoPrincipal.SelLength := Length(FindText);
      mmoPrincipal.SelText := ReplaceText;
    end else MessageDlg(Concat('Could not find "', FindText, '" in mmoPrincipal.'), mtError, [mbOk], 0);
  end;

end;

procedure TprincipalF.menuFonteClick(Sender: TObject);
begin
     FontDialog1.Font:=mmoPrincipal.Font;
     if FontDialog1.Execute then
        mmoPrincipal.Font:=FontDialog1.Font;
end;

procedure TprincipalF.FontDialog1ApplyClicked(Sender: TObject);
begin
    mmoPrincipal.Font.Style:= mmoPrincipal.Font.Style;
end;

end.

