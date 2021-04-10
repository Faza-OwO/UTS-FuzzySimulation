unit Unit1_home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  Thome = class(TForm)
    btn_learn: TBitBtn;
    btn_start: TBitBtn;
    img1: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure btn_startClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  home: Thome;

implementation
  uses
    crt,Unit2_rule,Math;
{$R *.dfm}

procedure Thome.btn_startClick(Sender: TObject);
begin
ruleset.Show;
home.Hide;
end;

end.
