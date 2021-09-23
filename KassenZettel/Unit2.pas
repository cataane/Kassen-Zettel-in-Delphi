unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TForm2 = class(TForm)
    myMemo: TMemo;
    btnZuKasse: TButton;
    btnZeigZetel: TButton;
    btnClrZettel: TButton;
    Label1: TLabel;
    procedure btnZeigZetelClick(Sender: TObject);
    procedure btnClrZettelClick(Sender: TObject);
    procedure btnZuKasseClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnClrZettelClick(Sender: TObject);

var
  zTxt : TextFile;

begin
  assignfile(zTxt, 'C:\Users\Robin Krause\Desktop\KassenZettel\zettel.txt');
  Rewrite(zTxt);
  CloseFile(zTxt);
end;

procedure TForm2.btnZeigZetelClick(Sender: TObject);

var
  zTxt : TextFile;
  sLine : string;

begin
  if FileExists('C:\Users\Robin Krause\Desktop\KassenZettel\zettel.txt') = False then
    begin
      ShowMessage('File not found!!!');
      Exit;
    end;
  myMemo.Clear;
  assignfile(zTxt, 'C:\Users\Robin Krause\Desktop\KassenZettel\zettel.txt');
  reset(zTxt);

  while not eof(zTxt) do
  begin
      readln(zTxt, sLine);
      myMemo.Lines.Add(sLine);
  end;

  CloseFile(zTxt);
end;

procedure TForm2.btnZuKasseClick(Sender: TObject);
begin
Form2.Close;
end;

end.
