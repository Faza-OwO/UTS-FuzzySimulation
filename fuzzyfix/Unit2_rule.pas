unit Unit2_rule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, SMDBGrid, DB, MemDS, VirtualTable,
  Buttons, jpeg, ExtCtrls;

type
  Truleset = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    btn_set: TBitBtn;
    edt_kecil: TEdit;
    edt_besar: TEdit;
    edt_berat: TEdit;
    edt_ringan: TEdit;
    edt_kotor: TEdit;
    edt_bersih: TEdit;
    btn1: TBitBtn;
    btn3: TBitBtn;
    img1: TImage;
    smdbgrd1: TSMDBGrid;
    vt1: TVirtualTable;
    ds1: TDataSource;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl7: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    procedure btn_setClick(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ruleset: Truleset;

implementation
uses
  crt,Unit1_home,Unit3_data;

{$R *.dfm}

procedure Truleset.btn_setClick(Sender: TObject);
var
no:Integer;
begin
  no:=1;
  no:= vt1.RecordCount+1;
   vt1.Append;
 vt1.FieldByName('Index').AsString:=    ('R '+IntToStr(no));
 vt1.FieldByName('Param-1').AsString:=  edt1.Text;
  vt1.FieldByName('Dec-1').AsString:=    edt2.Text;
  vt1.FieldByName('Param-2').AsString:=  edt3.Text;
  vt1.FieldByName('Dec-2').AsString:=    edt4.Text;
  vt1.FieldByName('Param-3').AsString:=  edt5.Text;
   vt1.FieldByName('Dec-3').AsString:=    edt6.Text;
   vt1.Post;
   
end;

procedure Truleset.btn3Click(Sender: TObject);
begin
data.Show;
ruleset.Hide;
end;

end.
