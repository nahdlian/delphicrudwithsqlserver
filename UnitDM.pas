unit UnitDM;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1nim: TStringField;
    ADOQuery1nama: TMemoField;
    ADOQuery1jenis_kelamin: TStringField;
    ADOQuery1jurusan: TStringField;
    ADOQuery1alamat: TMemoField;
    ADOQuery2: TADOQuery;
    ADOQuery2nim: TStringField;
    ADOQuery2nama: TMemoField;
    ADOQuery2jenis_kelamin: TStringField;
    ADOQuery2jurusan: TStringField;
    ADOQuery2alamat: TMemoField;
    procedure ADOQuery1alamatGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1namaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery2namaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery2alamatGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.ADOQuery1alamatGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text:=Copy(ADOQuery1alamat.AsString,1,200);
end;

procedure TDataModule1.ADOQuery1namaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    Text:=Copy(ADOQuery1nama.AsString,1,200);
end;

procedure TDataModule1.ADOQuery2namaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text:=Copy(ADOQuery2nama.AsString,1,200);
end;

procedure TDataModule1.ADOQuery2alamatGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text:=Copy(ADOQuery2alamat.AsString,1,200);
end;

end.
