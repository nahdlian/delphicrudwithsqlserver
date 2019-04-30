unit UnitDataDiri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, ADODB, DB, Grids, DBGrids;

type
  TFormDataDiri = class(TForm)
    Label1: TLabel;
    editNIM: TEdit;
    Label2: TLabel;
    editNama: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    cbbJurusan: TComboBox;
    Label5: TLabel;
    btnSimpan: TButton;
    btnBatal: TButton;
    ButtonQuery: TButton;
    Button2: TButton;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    cbbSearch: TComboBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure editNIMKeyPress(Sender: TObject; var Key: Char);
    procedure editNamaKeyPress(Sender: TObject; var Key: Char);
    procedure cbbJurusanKeyPress(Sender: TObject; var Key: Char);
    procedure btnSimpanClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure cbbJurusanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonQueryClick(Sender: TObject);
    procedure cbbSearchChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDataDiri: TFormDataDiri;

implementation
  uses UnitDM;
{$R *.dfm}

procedure TFormDataDiri.btnBatalClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFormDataDiri.btnSimpanClick(Sender: TObject);
var
  I: TDataModule1;
begin
  with DataModule1 do
  begin
  if(editNIM.Text='') or (editNama.Text='') or (RadioGroup1.ItemIndex=-1) or
  (cbbJurusan.ItemIndex=-1) or (Memo1.Text='') then
  begin
  ShowMessage('Lengkapi Data!!!');
  end else begin
  ADOTable1.Connection:=ADOConnection1;
  ADOTable1.Close;
  ADOTable1.Active:=false;
  ADOTable1.TableName:='mahasiswa';
  ADOTable1.Active:=True;
  ADOTable1.Append;
  ADOTable1['nim']:=editNIM.Text;
  ADOTable1['nama']:=editNama.Text;
  if (RadioGroup1.ItemIndex=0) then begin
    ADOTable1['jenis_kelamin']:='Laki-Laki';
  end
  else if (RadioGroup1.ItemIndex=1) then begin
    ADOTable1['jenis_kelamin']:='Perempuan';
  end;
  ADOTable1['jurusan']:=cbbJurusan.Text;
  ADOTable1['alamat']:=Memo1.Text;
  ADOTable1.Post;
  ShowMessage('Data Berhasil Disimpan!');
  end;
  end;
end;

procedure TFormDataDiri.Button1Click(Sender: TObject);
var jk : string;
begin
with DataModule1.ADOQuery1 do
begin
  if (RadioGroup1.ItemIndex=0) then begin
    jk:='Laki-Laki';
  end
  else if (RadioGroup1.ItemIndex=1) then begin
    jk:='Perempuan';
  end;
  Active:=false;
  Close;
  SQL.Clear;
  if(editNIM.Text='') or (editNama.Text='') or (RadioGroup1.ItemIndex=-1) or
  (cbbJurusan.ItemIndex=-1) or (Memo1.Text='') then
  begin
    ShowMessage('Lengkapi Data!!!');
  end else
  begin
    SQL.Text := 'update mahasiswa set nim= '+QuotedStr(editNIM.Text)+',nama='+
      QuotedStr(editNama.Text)+',jenis_kelamin='+QuotedStr(jk)+',jurusan='+
      QuotedStr(cbbJurusan.Text)+',alamat='+QuotedStr(Memo1.Text)+'where nim='
      +QuotedStr(editNIM.Text);
    ShowMessage('Data Berhasil DiUpdate!');
    ExecSQL;
    Active:=False;
    SQL.Clear;
    SQL.Text:='select * from mahasiswa';
    Active := True;
  end;
end;
end;

procedure TFormDataDiri.Button2Click(Sender: TObject);
var jk : string;
begin
with DataModule1.ADOQuery1 do
begin
    SQL.Text := 'delete from mahasiswa where nim='+QuotedStr(editNIM.Text);
    ShowMessage('Data Berhasil Dihapus!');
    ExecSQL;
    Active:=False;
    SQL.Clear;
    SQL.Text:='select * from mahasiswa';
    Active := True;
end;
end;

procedure TFormDataDiri.ButtonQueryClick(Sender: TObject);
var jk : string;
begin
with DataModule1.ADOQuery1 do
begin
  if (RadioGroup1.ItemIndex=0) then begin
    jk:='Laki-Laki';
  end
  else if (RadioGroup1.ItemIndex=1) then begin
    jk:='Perempuan';
  end;
  Active:=false;
  Close;
  SQL.Clear;
  if(editNIM.Text='') or (editNama.Text='') or (RadioGroup1.ItemIndex=-1) or
  (cbbJurusan.ItemIndex=-1) or (Memo1.Text='') then
  begin
    ShowMessage('Lengkapi Data!!!');
  end else
  begin
    SQL.Text := 'insert into mahasiswa values ('+QuotedStr(editNIM.Text)+','+
      QuotedStr(editNama.Text)+','+QuotedStr(jk)+','+
      QuotedStr(cbbJurusan.Text)+','+QuotedStr(Memo1.Text)+')';
    ShowMessage('Data Berhasil Disimpan!');
    ExecSQL;
    Active:=False;
    SQL.Clear;
    SQL.Text:='select * from mahasiswa';
    Active := True;

  end;
end;
end;

procedure TFormDataDiri.cbbJurusanClick(Sender: TObject);
begin
  cbbJurusan.Color:=clGreen;
end;

procedure TFormDataDiri.cbbJurusanKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    Memo1.SetFocus;
    Memo1.Color:=clGreen;
    cbbJurusan.Color:=clTeal;
  end;
end;

procedure TFormDataDiri.cbbSearchChange(Sender: TObject);
begin
  DataModule1.ADOQuery2.Connection := DataModule1.ADOConnection1;
  DataModule1.DataSource1.DataSet := DataModule1.ADOQuery2;
  DBGrid1.DataSource:=DataModule1.DataSource1;
  with DataModule1.ADOQuery2 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select * from mahasiswa WHERE jurusan = ' +QuotedStr(cbbSearch.Text)+';';
    Active := True;
  end;
end;

procedure TFormDataDiri.DBGrid1CellClick(Column: TColumn);
begin
dbgrid1.SelectedIndex :=0;
 editNIM.Text := DataModule1.ADOQuery1.Fieldbyname ('nim').AsString;
 editNIM.Enabled:= true;
 editNama.Text := DataModule1.ADOQuery1.fieldbyname('nama').AsString;
 Memo1.Text := DataModule1.ADOQuery1.fieldbyname('alamat').AsString ;
end;

procedure TFormDataDiri.editNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    RadioGroup1.ItemIndex:=0;
  end;
end;

procedure TFormDataDiri.editNIMKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    editNIM.Color:=clGreen;
    editNama.SetFocus;
    editNama.Color:=clGreen;
  end;
end;

procedure TFormDataDiri.FormCreate(Sender: TObject);
begin
with DataModule1 do
begin
//try
//  ADOConnection1.LoginPrompt:=false;
//  ADOConnection1.Connected:=false;
//  ADOConnection1.ConnectionString:=
//  'Provider=SQLOLEDB.1;Integrated Security=SSPI;'+
//  'Persist Security Info=False;Initial Catalog=mahasiswa;'+
//  'Data Source=LK1031';
//  ADOConnection1.Connected:=TRUE;
//  ShowMessage('Koneksi Database Berhasil :)');
//except
//  ShowMessage('Gagal Koneksi ke Database :(');
//end;
end;
end;

procedure TFormDataDiri.FormShow(Sender: TObject);
begin
  editNIM.Clear;
  editNama.Clear;
  Memo1.Clear;
  RadioGroup1.ItemIndex := -1;
  cbbJurusan.ItemIndex := 0;
  editNIM.SetFocus;
  editNIM.Color:=clTeal;

  //tampil data
  DataModule1.ADOQuery1.Connection := DataModule1.ADOConnection1;
  DataModule1.DataSource1.DataSet := DataModule1.ADOQuery1;
  DBGrid1.DataSource:=DataModule1.DataSource1;
  with DataModule1.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select * from mahasiswa';
    Active := True;
  end;
end;


procedure TFormDataDiri.RadioGroup1Click(Sender: TObject);
begin
  editNama.Color:=clTeal;
end;

end.
