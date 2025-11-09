PROGRAM By_Mico_P;
Uses Crt, Dos, Printer;

TYPE
  Karyawan = RECORD
    Nama   : String[20];
    Alamat : String[30];
    Umur   : Byte;
  END;

VAR
  Pegawai : Karyawan;
  F       : File of Karyawan;
  Kar     : Char;

{*** MEMBUAT FILE BARU ***}
PROCEDURE BuatFileBaru;
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'B:\PEGAWAI.DAT');
  Reset(F);
  IF IOResult <> 0 then ReWrite(F); { Membuat file baru }
  Seek(F, FileSize(F));

  (* PEMASUKAN DATA *)
  REPEAT
    With Pegawai do
    BEGIN
      WriteLn('Jumlah data = ', FileSize(F));
      WriteLn('Tekan saja ENTER untuk mengakhiri');
      WriteLn('NO: ', FileSize(F)+1);

      Write('Nama   : '); Readln(Nama);
      If Nama='' then Begin Close(F); Exit; End;
      Write('Alamat : '); Readln(Alamat);
      Write('Umur   : '); Readln(Umur);
      WriteLn;
      Write(F, Pegawai);
    END;
  UNTIL False;
END;


{*** MENAMPILKAN SEMUA DATA ***}
PROCEDURE LihatSemuaData;
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'B:\PEGAWAI.DAT');
  Reset(F);
  IF IOResult <> 0 then
  BEGIN
    WriteLn('File PEGAWAI.DAT tidak ditemukan!');
    Write('Tekan Enter...');
    Readln;
    Exit;
  END;

  With Pegawai do
  REPEAT
    Read(F, Pegawai);
    WriteLn('Nama   : ', Nama);
    WriteLn('Alamat : ', Alamat);
    WriteLn('Umur   : ', Umur);
    WriteLn;
  UNTIL EOF(F);

  Close(F);
  WriteLn; Write('Tekan Enter untuk kembali ke menu...');
  Readln;
END;


{*** MENCARI DATA LEWAT NOMOR ***}
PROCEDURE CariDataLewatNomor;
VAR NomorCari: Byte;
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'B:\PEGAWAI.DAT');
  Reset(F);
  IF IOResult <> 0 then
  BEGIN
    WriteLn('File PEGAWAI.DAT tidak ditemukan!');
    Write('Tekan Enter...');
    Readln;
    Exit;
  END;

  Write('Nomor akan dicari : '); Readln(NomorCari);
  WriteLn;

  If (NomorCari > FileSize(F)) then
  BEGIN
    WriteLn('Nomor tsb tidak ada!');
    Write('Tekan Enter...');
    Readln;
    Exit;
  END;

  With Pegawai do
  BEGIN
    Seek(F, NomorCari-1);
    Read(F, Pegawai);
    WriteLn('Nama   : ', Nama);
    WriteLn('Alamat : ', Alamat);
    WriteLn('Umur   : ', Umur);
  END;

  Close(F);
  WriteLn; Write('Tekan Enter untuk kembali ke menu...');
  Readln;
END;


{*** CARI DATA LEWAT NAMA ***}
PROCEDURE CariDataLewatNama;
VAR NamaCari:String[20];
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'B:\PEGAWAI.DAT');
  Reset(F);
  IF IOResult <> 0 then
  BEGIN
    WriteLn('File PEGAWAI.DAT tidak ditemukan!');
    Write('Tekan Enter...');
    Readln;
    Exit;
  END;

  Write('Ketik nama akan dicari : '); Readln(NamaCari);
  WriteLn;

  With Pegawai do
  While Not EOF(F) do
  BEGIN
    Read(F, Pegawai);
    If Nama=NamaCari then
    BEGIN
      WriteLn('Nama   : ', Nama);
      WriteLn('Alamat : ', Alamat);
      WriteLn('Umur   : ', Umur);
      WriteLn; Write('Tekan Enter untuk kembali ke menu...');
      Readln;
      Exit;
    END;
  END;

  Close(F);
  Write('Nama tersebut tidak ada! Tekan ENTER...');
  Readln;
END;


{*** MENGGANTI DATA LEWAT NOMOR ***}
PROCEDURE GantiDataLewatNomor;
VAR NomorGanti:Byte;
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'B:\PEGAWAI.DAT');
  Reset(F);
  IF IOResult <> 0 then
  BEGIN
    WriteLn('File PEGAWAI.DAT tidak ditemukan!');
    Write('Tekan Enter...');
    Readln;
    Exit;
  END;

  Write('Nomor record akan diganti [0=Keluar]: ');
  Readln(NomorGanti);
  If NomorGanti=0 then Exit;

  If (NomorGanti<1) or (NomorGanti>FileSize(F)) then
  BEGIN
    WriteLn('Nomor tsb tidak ada!');
    Write('Tekan Enter...');
    Readln;
    Close(F);
    Exit;
  END;

  With Pegawai do
  {Pengulangan While Not EOF(F) di halaman 344 tidak diperlukan di sini karena Seek sudah spesifik}
  BEGIN
    Seek(F, NomorGanti-1);
    Read(F, Pegawai);
    WriteLn('Nomor record = ', NomorGanti);
    WriteLn;
    WriteLn('Nama   : ', Nama);
    WriteLn('Alamat : ', Alamat);
    WriteLn('Umur   : ', Umur);
    WriteLn;

    WriteLn('DIGANTI MENJADI: ');
    WriteLn;
    Write('Nama   : '); Readln(Nama);
    Write('Alamat : '); Readln(Alamat);
    Write('Umur   : '); Readln(Umur);
    WriteLn;

    Seek(F, NomorGanti-1);
    Write(F, Pegawai);
    Close(F);
    WriteLn; Write('Tekan Enter untuk kembali ke menu...');
    Readln;
    Exit;
  END;
  {Penambahan End setelah Exit (halaman 345) untuk menutup scope With dan Procedure}
END;


{*** GANTI DATA LEWAT NAMA ***}
PROCEDURE GantiDataLewatNama;
VAR NamaGanti:String[20];
    Nomor:Integer;
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'B:\PEGAWAI.DAT');
  Reset(F);
  IF IOResult <> 0 then
  BEGIN
    WriteLn('File PEGAWAI.DAT tidak ditemukan!');
    Write('Tekan Enter...');
    Readln;
    Exit;
  END;

  Write('Nama akan diganti [ Enter = Keluar]: ');
  Readln(NamaGanti);
  If NamaGanti = '' then Exit;
  WriteLn;

  Nomor:=-1;
  With Pegawai do
  While Not EOF(F) do
  BEGIN
    Inc(Nomor);
    Read(F, Pegawai);

    If Nama=NamaGanti then
    BEGIN
      WriteLn('Nama   : ', Nama);
      WriteLn('Alamat : ', Alamat);
      WriteLn('Umur   : ', Umur);
      WriteLn;
      WriteLn('DIGANTI MENJADI: ');
      WriteLn;
      Write('Nama   : '); Readln(Nama);
      Write('Alamat : '); Readln(Alamat);
      Write('Umur   : '); Readln(Umur);

      Seek(F, Nomor);
      Write(F, Pegawai);
      Close(F);
      WriteLn; Write('Tekan Enter untuk kembali ke menu...');
      Readln;
      Exit;
    END;
  END;

  Close(F);
  Write('Nama tersebut tidak ada! Tekan ENTER...');
  Readln;
END;


{*** MENGHAPUS DATA LEWAT NOMOR RECORD ***}
PROCEDURE HapusDataLewatNomor;
TYPE
  RekamanBaru = Record
    NamaBaru   : String[20];
    AlamatBaru : String[30];
    UmurBaru   : Byte;
  END;

VAR
  Baru        : RekamanBaru;
  FileBaru    : File of RekamanBaru;
  NomorRecord : Integer;
  NomorHapus  : Integer;
  Kar         : Char;
BEGIN
  ClrScr;
  Assign(F, 'B:\PEGAWAI.DAT');
  {$I-} Reset(F); {$I+}
  If IOResult <> 0 then
  BEGIN
    WriteLn('File PEGAWAI.DAT tidak ditemukan!');
    Write('Tekan Enter...');
    Readln;
    Exit;
  END;

  WriteLn('Jumlah data = ', FileSize(F));
  WriteLn;

  With Pegawai do
  REPEAT
    ClrScr;
    Write('Nomor record akan dihapus [0 = Keluar]? : ');
    Readln(NomorHapus);
    If NomorHapus = 0 then Exit;

    If (NomorHapus < 1) or (NomorHapus > FileSize(F)) then
    BEGIN
      WriteLn('Nomor tersebut tidak ada!');
      Write('Tekan Enter...');
      Readln;
      Close(F);
      Exit;
    END;

    Seek(F, NomorHapus - 1);
    Read(F, Pegawai);
    WriteLn;
    WriteLn('Nomor Record = ', NomorHapus);
    WriteLn;
    WriteLn('Nama   : ', Nama);
    WriteLn('Alamat : ', Alamat);
    WriteLn('Umur   : ', Umur);
    WriteLn;

    Write('Data inikah yang akan dihapus? [Y/T]: ');
    Kar := UpCase(Readkey);
  UNTIL Kar='Y';

  Assign(FileBaru, 'B:\TEMPORER.DAT');
  {$I-} Reset(FileBaru); {$I+}
  If IOResult <> 0 then ReWrite(FileBaru);

  NomorRecord := -1; {Mengubah dari 0 ke -1 agar nomor record pertama adalah 0 saat Inc()}
  Seek(F, 0);

  With Pegawai, Baru do
  REPEAT
    Read(F, Pegawai);
    Inc(NomorRecord);
    If NomorRecord <> NomorHapus - 1 then {Perbaikan: Bandingkan dengan indeks record yang dihapus}
    BEGIN
      NamaBaru   := Nama;
      AlamatBaru := Alamat;
      UmurBaru   := Umur;
      Write(FileBaru, Baru);
    END;
  UNTIL Eof(F);

  Close(F);
  Close(FileBaru);
  Erase(F);
  Rename(FileBaru, 'B:\PEGAWAI.DAT');
END;


{*** MENCETAK DATA KE PRINTER ***}
PROCEDURE CetakDataKePrinter;
VAR NomorUrut:Integer;
BEGIN
  ClrScr;
  WriteLn('SIAPKAN PRINTER DAN KERTAS.');
  WriteLn('Setelah selesai tekan Enter untuk mencetak...');
  Readln;

  Assign(F, 'B:\PEGAWAI.DAT');
  {$I-} Reset(F); {$I+}
  If IOResult <> 0 then
  BEGIN
    WriteLn;
    WriteLn('File "PEGAWAI.DAT" tidak dapat ditemukan!');
    Write('Tekan Enter untuk kembali ke menu...');
    Readln;
    Exit;
  END;

  ClrScr;
  Write(Lst, #15, 'NO', 'NAMA':22, 'ALAMAT':30, 'UMUR':10);
  WriteLn(Lst); WriteLn(Lst);

  NomorUrut:=-1; {Diubah dari 0 ke -1}
  With Pegawai do
  REPEAT
    Inc(NomorUrut);
    Read(F, Pegawai);
    WriteLn(Lst, #15, NomorUrut + 1, Nama:22, Alamat:30, Umur:10);
  UNTIL EOF(F);

  Close(F);
  WriteLn; Write('Tekan Enter untuk kembali ke menu...');
  Readln;
END;


{*** MENGGANTI NAMA SEMBARANG FILE ***}
PROCEDURE MenggantiNamaFile;
VAR NamaFile, NamaBaru:String[79];
    F:File;
BEGIN
  ClrScr;
  WriteLn('MENGGANTI NAMA FILE');
  WriteLn;
  Write('Ketik nama file yang akan diganti [Enter=Keluar]: ');
  Readln(NamaFile);
  If NamaFile='' then Exit;

  Assign(F, NamaFile);
  {$I-} Reset(F); {$I+}
  If IOResult <> 0 then
  BEGIN
    WriteLn;
    WriteLn('File "', NamaFile, '" tidak dapat ditemukan!');
    Write('Tekan Enter untuk kembali ke menu...');
    Readln;
    Exit;
  END;

  WriteLn;
  WriteLn('FILE DITEMUKAN!');
  Write('Diganti menjadi (lengkap dengan drive): ');
  Readln(NamaBaru);

  Close(F); { Tutup file terlebih dahulu }
  {$I-} Rename(F, NamaBaru); {$I+}
  IF IOResult = 0 then
  BEGIN
    WriteLn;
    WriteLn('Sukses, nama file telah diganti!');
    Write('Tekan Enter untuk kembali ke menu...');
    Readln;
  END
  ELSE
  BEGIN
    WriteLn;
    WriteLn('Wah, tidak dapat diganti, sobat!');
    Write('Tekan Enter untuk kembali ke menu...');
    Readln;
  END;
END;


{*** MENGHAPUS SEMBARANG TIPE FILE ***}
PROCEDURE HapusFile;
VAR SembarangFile:File;
    NamaFile:String;
BEGIN
  ClrScr;
  Write('Ketik nama file akan dihapus [Enter=Keluar]: ');
  Readln(NamaFile);
  If NamaFile='' then Exit;

  Assign(SembarangFile, NamaFile);
  {$I-} Reset(SembarangFile); {$I+}
  If IOResult <> 0 then
  BEGIN
    WriteLn('File ', NamaFile, ' tidak ditemukan!');
    Write('Tekan Enter untuk kembali ke menu...');
    Readln;
    Exit;
  END;

  WriteLn;
  WriteLn('DITEMUKAN!');
  Write('Yakin file ', NamaFile, ' akan dihapus [Y/T] ? ');
  Kar:=Upcase(Readkey);
  If Kar='Y' then
  BEGIN
    Close(SembarangFile); { Tutup dahulu baru file tsb dihapus }
    {$I-} Erase(SembarangFile); {$I+} {Menghapus file}
    WriteLn;
    If IOResult = 0 then
    BEGIN
      WriteLn('Sukses, file ', NamaFile, ' telah dihapus.');
      Write('Tekan Enter untu kembali ke menu...');
      Readln;
    END
    Else
      WriteLn('File ', NamaFile, ' tidak dapat dihapus!');
  END;
END;


{**** KURSOR **** }
Procedure Kursor(AwalKursor,AkhirKursor:Byte);
Var Reg: Registers;
Begin
  Reg.AH := 1;
  Reg.CH := AwalKursor;
  Reg.CL := AkhirKursor;
  Intr($10, Reg);
End;

{=== PROGRAM UTAMA ===}
BEGIN
  Repeat
    Kursor(7,0);
    TextBackGround(0); Window(1,1,80,25); ClrScr;

    TextColor(15);
    GotoXY(37,4); WriteLn('M E N U');

    TextColor(15); TextbackGround(14);
    GotoXY(24,7); WriteLn('F1 ');
    GotoXY(24,8); WriteLn('F2 ');
    GotoXY(24,9); WriteLn('F3 ');
    GotoXY(24,10); WriteLn('F4 ');
    GotoXY(24,11); WriteLn('F5 ');
    GotoXY(24,12); WriteLn('F6 ');
    GotoXY(24,13); WriteLn('F7 ');
    GotoXY(24,14); WriteLn('F8 ');
    GotoXY(24,15); WriteLn('F9 ');
    GotoXY(24,16); WriteLn('F10');
    GotoXY(24,18); WriteLn('ESC');

    Textattr := 7; Textcolor(10);
    GotoXY(29,7); WriteLn('Membuat File Baru atau Menambah Data');
    GotoXY(29,8); WriteLn('Melihat Semua Data');
    GotoXY(29,9); WriteLn('Mencari Data Lewat Nomor');
    GotoXY(29,10); WriteLn('Mencari Data Lewat Nama');
    GotoXY(29,11); WriteLn('Mengganti Data Lewat Nomor');
    GotoXY(29,12); WriteLn('Mengganti Data Lewat Nama');
    GotoXY(29,13); WriteLn('Menghapus Data Lewat Nomor');
    GotoXY(29,14); WriteLn('Cetak Data Ke Printer');
    GotoXY(29,15); WriteLn('Mengganti Nama File (sembarang file)');
    GotoXY(29,16); WriteLn('Menghapus File (sembarang file)');
    GotoXY(29,18); WriteLn('KELUAR');

    TextColor(15); TextbackGround(1);
    GotoXY(65,24); WriteLn('BY: MICO.P');

    Kar := Readkey;
    Case Kar of
      #59 : Begin Kursor(0,7); BuatFileBaru; End;
      #60 : LihatSemuaData; End;
      #61 : Begin Kursor(0,7); CariDataLewatNomor; End;
      #62 : Begin Kursor(0,7); CariDataLewatNama; End;
      #63 : Begin Kursor(0,7); GantiDataLewatNomor; End;
      #64 : Begin Kursor(0,7); GantiDataLewatNama; End;
      #65 : Begin Kursor(0,7); HapusDataLewatNomor; End;
      #66 : CetakDataKePrinter; End;
      #67 : Begin Kursor(0,7); MenggantiNamaFile; End;
      #68 : Begin Kursor(0,7); HapusFile; End;
      #27 : Begin
              TextBackGround(0); Textattr:=7;
              TextColor(7); Window(1,1,80,25);
              ClrScr; Kursor(3,5); EXIT;
            End;
    End; {End Case}
    Sound(140); Delay(30);
    Sound(140); Delay(50); Nosound;
  Until False;
END.
