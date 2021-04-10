unit Unit3_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid, DB, MemDS,
  VirtualTable, TeEngine, Series, ExtCtrls, TeeProcs, Chart, jpeg;

type
  Tdata = class(TForm)
    edt1: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    cbb1: TComboBox;
    btn_set: TBitBtn;
    btn1: TBitBtn;
    btn3: TBitBtn;
    btn2: TBitBtn;
    edt2: TEdit;
    edt_kecil: TEdit;
    edt_besar: TEdit;
    edt_berat: TEdit;
    edt_ringan: TEdit;
    edt_kotor: TEdit;
    edt_bersih: TEdit;
    img1: TImage;
    smdbgrd1: TSMDBGrid;
    vt1: TVirtualTable;
    ds1: TDataSource;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn_setClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  data: Tdata;

implementation
uses
  crt,Unit2_rule,Unit4_simulasi;

{$R *.dfm}

procedure Tdata.btn1Click(Sender: TObject);
begin
cbb1.Clear;
edt1.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
edt6.Clear;
end;

procedure Tdata.btn_setClick(Sender: TObject);

begin

  vt1.Append;
   vt1.FieldByName('Variable').AsString:=    edt2.Text;
   vt1.FieldByName('Type').AsString:=   cbb1.Text;
   vt1.FieldByName('bb-nama').AsString:=  edt1.Text;
   vt1.FieldByName('bb-value').AsInteger:=  StrToInt(edt3.Text);
   vt1.FieldByName('ba-nama').AsString:=    edt4.Text;
   vt1.FieldByName('ba-value').AsInteger:=  StrToInt(edt5.Text);
   vt1.FieldByName('Satuan').AsString:=    edt6.Text;
   vt1.Post;

end;

procedure Tdata.btn3Click(Sender: TObject);
begin
data.Hide;
ruleset.Show;
end;

procedure Tdata.btn2Click(Sender: TObject);
begin
data.Hide;
simulasi.Show;
end;

end.
