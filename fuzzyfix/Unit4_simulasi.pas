unit Unit4_simulasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  jpeg;

type
  Tsimulasi = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt_volume: TEdit;
    edt_massa: TEdit;
    edt_kecil: TEdit;
    edt_besar: TEdit;
    edt_berat: TEdit;
    edt_ringan: TEdit;
    edt_kotor: TEdit;
    edt_bersih: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    cht_volume: TChart;
    Besar: TFastLineSeries;
    Kecil: TFastLineSeries;
    btn1: TBitBtn;
    cht_massa: TChart;
    Berat: TFastLineSeries;
    Ringan: TFastLineSeries;
    btn2: TBitBtn;
    Label1: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    edt_ukecil: TEdit;
    edt_ubesar: TEdit;
    edt_uringan: TEdit;
    edt_uberat: TEdit;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    edt_r1: TEdit;
    edt_r2: TEdit;
    edt_r3: TEdit;
    edt_r4: TEdit;
    lbl26: TLabel;
    pnl1: TPanel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    edt_nilair1: TEdit;
    edt_nilair2: TEdit;
    edt_nilair3: TEdit;
    edt_nilair4: TEdit;
    edt_decr1: TEdit;
    edt_decr2: TEdit;
    edt_decr3: TEdit;
    edt_decr4: TEdit;
    lbl32: TLabel;
    pnl2: TPanel;
    lbl33: TLabel;
    edt_kompokotor: TEdit;
    lbl34: TLabel;
    lbl35: TLabel;
    edt_kompobersih: TEdit;
    pnl3: TPanel;
    lbl36: TLabel;
    edt_rbertambah1: TEdit;
    btn3: TBitBtn;
    edt_rbertambah2: TEdit;
    edt_rbertambah3: TEdit;
    edt_rberkurang1: TEdit;
    edt_rberkurang2: TEdit;
    edt_rberkurang3: TEdit;
    lbl37: TLabel;
    lbl38: TLabel;
    pnl4: TPanel;
    lbl39: TLabel;
    lbl40: TLabel;
    edt_emisi: TEdit;
    btn4: TBitBtn;
    edt_rbertambah4: TEdit;
    edt_rbertambah5: TEdit;
    edt_rberkurang4: TEdit;
    edt_rberkurang5: TEdit;
    edt_rbertambah6: TEdit;
    edt_rberkurang6: TEdit;
    btnout: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  simulasi: Tsimulasi;

implementation
uses
  crt,Unit3_data,Unit2_rule,Math;

{$R *.dfm}

procedure Tsimulasi.btn1Click(Sender: TObject);
var
  besar,kecil:Integer;
  ringan,berat:Integer;
  volume,massa:Integer;
  r1,r2,r3,r4:Extended;
  ukecil,ubesar,uringan,uberat:Extended;
begin
  //proses ambil data dari form
  kecil:= StrToInt(edt_kecil.Text);
  besar:= StrToInt(edt_besar.Text);
  volume:= StrToInt(edt_volume.Text);
  massa:= StrToInt(edt_massa.Text);
  //proses penggambaran chart
  cht_volume.Series[0].AddXY(kecil,0);
  cht_volume.Series[0].AddXY(besar,1);
  cht_volume.Series[1].AddXY(kecil,1);
  cht_volume.Series[1].AddXY(besar,0);
  ringan:= StrToInt(edt_ringan.Text);
  berat:= StrToInt(edt_berat.Text);
  cht_massa.Series[0].AddXY(ringan,0);
  cht_massa.Series[0].AddXY(berat,1);
  cht_massa.Series[1].AddXY(ringan,1);
  cht_massa.Series[1].AddXY(berat,0);
   //perhitungan fuzzifikasi pada chart
   ukecil:= (besar-volume)/(besar-kecil);
   edt_ukecil.Text:= FloatToStr(ukecil);
   edt_ukecil.Text:= FormatFloat('0.###',ukecil);
   ubesar:= (volume-kecil)/(besar-kecil);
   edt_ubesar.Text:= FloatToStr(ubesar);
   edt_ubesar.Text:= FormatFloat('0.###',ubesar);

   uringan:= (berat-massa)/(berat-ringan);
   edt_uringan.Text:= FloatToStr(uringan);
   edt_uringan.Text:= FormatFloat('0.###',uringan);
   uberat:= (massa-ringan)/(berat-ringan);
   edt_uberat.Text:= FloatToStr(uberat);
   edt_uberat.Text:= FormatFloat('0.###',uberat);
   //operasi fuzzy
   r1:= min(ukecil,uberat);
   edt_r1.Text:= FloatToStr(r1);
   edt_r1.Text:= FormatFloat('0.###',r1);
   r2:= min(ukecil,uringan);
   edt_r2.Text:= FloatToStr(r2);
   edt_r2.Text:= FormatFloat('0.###',r2);
   r3:= min(ubesar,uberat);
   edt_r3.Text:= FloatToStr(r3);
   edt_r3.Text:= FormatFloat('0.###',r3);
   r4:= min(ubesar,uringan);
   edt_r4.Text:= FloatToStr(r4);
   edt_r4.Text:= FormatFloat('0.###',r4);
   //implikasi
   edt_nilair1.Text:= edt_r1.Text;
   edt_nilair2.Text:= edt_r2.Text;
   edt_nilair3.Text:= edt_r3.Text;
   edt_nilair4.Text:= edt_r4.Text;
   //aturan komposisi
   if r1 >= r3 then begin
      edt_kompokotor.Text:= edt_r1.Text;
   end else
    edt_kompokotor.Text:= edt_r3.Text;
   if r2 >= r4 then begin
      edt_kompobersih.Text:= edt_r2.Text;
   end else
    edt_kompobersih.Text:= edt_r4.Text;


end;

procedure Tsimulasi.btn2Click(Sender: TObject);
begin
cht_volume.Series[0].Clear;
cht_volume.Series[1].Clear;
cht_massa.Series[0].Clear;
cht_massa.Series[1].Clear;
end;

procedure Tsimulasi.btn3Click(Sender: TObject);
var
  acak1,acak2,acak3,acak4,acak5,acak6,bersih,kotor:Integer;
  a1,a2,a3,a4,a5,a6:Integer;
begin
  bersih:= StrToInt(edt_bersih.Text);
  kotor:= StrToInt(edt_kotor.Text);
  acak1:= RandomRange(bersih,kotor);
  acak2:= RandomRange(bersih,kotor);
  acak3:= RandomRange(bersih,kotor);
  acak4:= RandomRange(bersih,kotor);
  acak5:= RandomRange(bersih,kotor);
  acak6:= RandomRange(bersih,kotor);
  a1:= RandomRange(bersih,kotor);
  a2:= RandomRange(bersih,kotor);
  a3:= RandomRange(bersih,kotor);
  a4:= RandomRange(bersih,kotor);
  a5:= RandomRange(bersih,kotor);
  a6:= RandomRange(bersih,kotor);
edt_rbertambah1.Text := IntToStr(acak1);
edt_rbertambah2.Text := IntToStr(acak2);
edt_rbertambah3.Text := IntToStr(acak3);
edt_rbertambah4.Text := IntToStr(a1);
edt_rbertambah5.Text := IntToStr(a2);
edt_rbertambah6.Text := IntToStr(a3);
edt_rberkurang1.Text := IntToStr(acak4);
edt_rberkurang2.Text := IntToStr(acak5);
edt_rberkurang3.Text := IntToStr(acak6);
edt_rberkurang4.Text := IntToStr(a4);
edt_rberkurang5.Text := IntToStr(a5);
edt_rberkurang6.Text := IntToStr(a6);
end;

procedure Tsimulasi.btn4Click(Sender: TObject);
var
  k1,k2,k3,k4,k5,k6,b1,b2,b3,b4,b5,b6:Integer;
  kompokotor,kompobersih,hasil:Extended;
begin
  k1:= StrToInt(edt_rberkurang1.Text);
  k2:= StrToInt(edt_rberkurang2.Text);
  k3:= StrToInt(edt_rberkurang3.Text);
  k4:= StrToInt(edt_rberkurang4.Text);
  k5:= StrToInt(edt_rberkurang5.Text);
  k6:= StrToInt(edt_rberkurang6.Text);
  b1:= StrToInt(edt_rbertambah1.Text);
  b2:= StrToInt(edt_rbertambah2.Text);
  b3:= StrToInt(edt_rbertambah3.Text);
  b4:= StrToInt(edt_rbertambah4.Text);
  b5:= StrToInt(edt_rbertambah5.Text);
  b6:= StrToInt(edt_rbertambah6.Text);
  kompokotor:= StrToFloat(edt_kompokotor.Text);
  kompobersih:= StrToFloat(edt_kompobersih.Text);

  hasil:= Round((((k1+k2+k3+k4+k5+k6)*kompokotor + (b1+b2+b3+b4+b5+b6)*kompobersih )/((kompokotor*6) + (kompobersih*6))));
  edt_emisi.Text:= FloatToStr(hasil);

end;

procedure Tsimulasi.FormCreate(Sender: TObject);
begin
lbl6.Caption:= ruleset.edt_kecil.Text;
end;

procedure Tsimulasi.btnoutClick(Sender: TObject);
begin
simulasi.Hide;
ruleset.Show;
end;

end.
