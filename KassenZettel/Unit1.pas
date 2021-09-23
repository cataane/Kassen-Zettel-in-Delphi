unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    myLblTitel: TLabel;
    myLblTime: TLabel;
    myLblStuckzahl: TLabel;
    myLblEinzelpreis: TLabel;
    myLblGrundpreis: TLabel;
    myLblRabattsatz: TLabel;
    myLblSkontosatz: TLabel;
    myLblRabatt: TLabel;
    myLblSkonto: TLabel;
    myLblPro1: TLabel;
    myLblPro2: TLabel;
    myEditStückzahl: TEdit;
    myEditEinzelpreis: TEdit;
    myEditRabattsatz: TEdit;
    myEditSkontosatz: TEdit;
    myLblEndPreis: TLabel;
    myEditGrundpreis: TEdit;
    myEditRabatt: TEdit;
    myEditSkonto: TEdit;
    myEditEndpreis: TEdit;
    btnShowZettel: TButton;
    btnKasse: TButton;
    btnQuit: TButton;
    procedure btnKasseClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnShowZettelClick(Sender: TObject);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnKasseClick(Sender: TObject);

var
  stk, preis, grundpreis, grundpreis_Rabatt, rabattsatz, rabatt, skontosatz, skonto, endpreis : Double;
  zTxt : TextFile;
  myDate : TDateTime;

  Liste: TStringList;

begin

  rabatt := 0;
  Skonto := 0;

  //write DateTime
  myDate:= Now;
  DateSeparator := '-';
  TimeSeparator := ':';
  myLblTime.Caption := DateTimeToStr(myDate);

  //input Stück and Preis/Stück
  stk := StrToInt(myEditStückzahl.Text);
  preis := StrToInt(myEditEinzelpreis.Text);

  //calculate adn write Grundpreis
  grundpreis := (stk * preis);
  myEditGrundpreis.Text := FloatToStr(grundpreis);

  Liste := TStringList.Create;

  //condition Rabattsatz
  try
    rabattsatz := StrToInt(myEditRabattsatz.Text);
  except
    on e: exception do rabattsatz := 0;
  end;

  if rabattsatz > 0 then
  begin
      rabatt := (grundpreis * rabattsatz / 100);          //calculate Rabatt
      myEditRabatt.Text := FloatToStr(rabatt);            //write Rabatt
  end;
  grundpreis_Rabatt := Grundpreis - Rabatt;

  //condition Skontosatz
  try
    skontosatz := StrToInt(myEditSkontosatz.Text);
  except
    on e: exception do skontosatz := 0;
  end;

  if skontosatz > 0 then
  begin
      skonto := (grundpreis_Rabatt * skontosatz / 100);   //calculate Skonto
      myEditSkonto.Text := FloatToStr(skonto);            //write Skonto
  end;

  //calculate and write Endpreis
  endpreis := (grundpreis - rabatt - skonto);
  myEditEndpreis.Text := FloatToStr(endpreis);

  //write in TextFile
  Liste.Add('TimeStamp   = ' + myLblTime.Caption);
  Liste.Add('Einzelpreis   = ' + myEditEinzelpreis.Text);
  Liste.Add('Stückzahl     = ' + myEditStückzahl.Text);
  Liste.Add('Grundpreis   = ' + myEditGrundpreis.Text);
  Liste.Add('Rabattsatz  = ' + myEditRabattsatz.Text);
  Liste.Add('Skontosatz  = ' + myEditSkontosatz.Text);
  Liste.Add('Rabatt         = ' + myEditRabatt.Text);
  Liste.Add('Skonto         = ' + myEditSkonto.Text);
  Liste.Add('Endpreis      = ' + myEditEndpreis.Text);
  Liste.Add('______________________________');
  Liste.Add('=======================');


  Reset(zTxt, 'C:\Users\Robin Krause\Desktop\KassenZettel\zettel.txt');

  Append(zTxt);

  Write(zTxt, Liste.Text);

  CloseFile(zTxt);
  Liste.Free;

  ShowMessage('Zettel Saved in TextFile');
end;

procedure TForm1.btnQuitClick(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.btnShowZettelClick(Sender: TObject);
begin
Form2.Show;
end;

end.
