program Biodata;

uses
  Forms,
  UnitDataDiri in 'UnitDataDiri.pas' {FormDataDiri},
  UnitDM in 'UnitDM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDataDiri, FormDataDiri);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
