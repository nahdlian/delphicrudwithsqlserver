object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 197
  Width = 265
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=sekolah;Data Source=DESKTOP-F9S5IT1;Use' +
      ' Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wo' +
      'rkstation ID=LK1031;Use Encryption for Data=False;Tag with colum' +
      'n collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select*From Biodata')
    Left = 104
    Top = 24
    object ADOQuery1nim: TStringField
      DisplayLabel = 'NIM'
      DisplayWidth = 15
      FieldName = 'nim'
      Size = 50
    end
    object ADOQuery1nama: TMemoField
      DisplayLabel = 'Nama'
      DisplayWidth = 30
      FieldName = 'nama'
      OnGetText = ADOQuery1namaGetText
      BlobType = ftMemo
    end
    object ADOQuery1jenis_kelamin: TStringField
      DisplayLabel = 'Jenis Kelamin'
      DisplayWidth = 15
      FieldName = 'jenis_kelamin'
    end
    object ADOQuery1jurusan: TStringField
      DisplayLabel = 'Prodi'
      DisplayWidth = 25
      FieldName = 'jurusan'
      Size = 50
    end
    object ADOQuery1alamat: TMemoField
      DisplayLabel = 'Alamat'
      DisplayWidth = 35
      FieldName = 'alamat'
      OnGetText = ADOQuery1alamatGetText
      BlobType = ftMemo
    end
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 176
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 24
    Top = 96
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Biodata WHERE jurusan = '#39#39)
    Left = 104
    Top = 96
    object ADOQuery2nim: TStringField
      DisplayLabel = 'NIM'
      DisplayWidth = 15
      FieldName = 'nim'
      Size = 50
    end
    object ADOQuery2nama: TMemoField
      DisplayLabel = 'Nama'
      DisplayWidth = 25
      FieldName = 'nama'
      OnGetText = ADOQuery2namaGetText
      BlobType = ftMemo
    end
    object ADOQuery2jenis_kelamin: TStringField
      DisplayLabel = 'Jenis Kelamin'
      DisplayWidth = 15
      FieldName = 'jenis_kelamin'
    end
    object ADOQuery2jurusan: TStringField
      DisplayLabel = 'Prodi'
      DisplayWidth = 20
      FieldName = 'jurusan'
      Size = 50
    end
    object ADOQuery2alamat: TMemoField
      DisplayLabel = 'Alamat'
      DisplayWidth = 35
      FieldName = 'alamat'
      OnGetText = ADOQuery2alamatGetText
      BlobType = ftMemo
    end
  end
end
