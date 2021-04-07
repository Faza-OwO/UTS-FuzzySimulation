program Project1;

uses
  Forms,
  Unit1_home in 'Unit1_home.pas' {home},
  Unit2_rule in 'Unit2_rule.pas' {ruleset},
  Unit3_data in 'Unit3_data.pas' {data},
  Unit4_simulasi in 'Unit4_simulasi.pas' {simulasi};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Thome, home);
  Application.CreateForm(Truleset, ruleset);
  Application.CreateForm(Tdata, data);
  Application.CreateForm(Tsimulasi, simulasi);
  Application.Run;
end.
