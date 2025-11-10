PROGRAM By_Mico_P;
Uses Crt; 

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
  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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
  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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
  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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

  If (NomorCari > FileSize(F)) or (NomorCari < 1) then {Perbaikan kecil}
  BEGIN
    WriteLn('Nomor tsb tidak ada!');
    Write('Tekan Enter...');
    Readln;
    Close(F); {Tutup file sebelum keluar}
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
  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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
      Close(F); {Tutup file sebelum keluar}
      Exit;
    END;
  END;

  Close(F);
  Write('Nama tersebut tidak ada! Tekan ENTER...');
  Readln;
END;


{*** MENGGANTI DATA LEWAT NOMOR ***}
PROCEDURE GantiDataLewatNomor;
VAR NomorGanti:Integer; {Byte hanya sampai 255, Integer lebih aman}
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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
  If NomorGanti=0 then 
  BEGIN
    Close(F);
    Exit;
  END;

  If (NomorGanti<1) or (NomorGanti>FileSize(F)) then
  BEGIN
    WriteLn('Nomor tsb tidak ada!');
    Write('Tekan Enter...');
    Readln;
    Close(F);
    Exit;
  END;

  With Pegawai do
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
END;


{*** GANTI DATA LEWAT NAMA ***}
PROCEDURE GantiDataLewatNama;
VAR NamaGanti:String[20];
    Nomor:Integer;
BEGIN
  ClrScr;
  {$I-}
  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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
  If NamaGanti = '' then 
  BEGIN
    Close(F);
    Exit;
  END;
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
  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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
    Write('Nomor record akan dihapus [0 = Keluar]? : ');
    Readln(NomorHapus);
    If NomorHapus = 0 then 
    BEGIN
        Close(F);
        Exit;
    END;

    If (NomorHapus < 1) or (NomorHapus > FileSize(F)) then
    BEGIN
      WriteLn('Nomor tersebut tidak ada!');
      Write('Tekan Enter...');
      Readln;
      {Jangan keluar, biarkan loop REPEAT mengulang}
    END
    ELSE
    BEGIN
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
      WriteLn;
      IF Kar = 'Y' THEN Break; {Keluar dari loop jika ya}
    END;
  UNTIL False; {Loop akan berhenti dengan Break}

  Assign(FileBaru, 'TEMPORER.DAT'); {FIX 1: Mengganti path B:\}
  {$I-} ReWrite(FileBaru); {$I+} {Selalu ReWrite file temporer}
  
  NomorRecord := -1; 
  Seek(F, 0);

  With Pegawai, Baru do
  While not Eof(F) do {Ganti REPEAT UNTIL dengan WHILE NOT EOF}
  BEGIN
    Read(F, Pegawai);
    Inc(NomorRecord);
    If NomorRecord <> (NomorHapus - 1) then 
    BEGIN
      NamaBaru   := Nama;
      AlamatBaru := Alamat;
      UmurBaru   := Umur;
      Write(FileBaru, Baru);
    END;
  END;

  Close(F);
  Close(FileBaru);
  
  Assign(F, 'PEGAWAI.DAT'); {Assign ulang F}
  Erase(F);
  
  Assign(FileBaru, 'TEMPORER.DAT'); {Assign ulang FileBaru}
  Rename(FileBaru, 'PEGAWAI.DAT'); {Ubah nama}
END;


{*** MENCETAK DATA KE PRINTER ***}
{ FIX 4: Prosedur ini dinonaktifkan karena unit 'Printer' tidak kompatibel }
{
PROCEDURE CetakDataKePrinter;
VAR NomorUrut:Integer;
BEGIN
  ClrScr;
  WriteLn('SIAPKAN PRINTER DAN KERTAS.');
  WriteLn('Setelah selesai tekan Enter untuk mencetak...');
  Readln;

  Assign(F, 'PEGAWAI.DAT'); {FIX 1: Mengganti path B:\}
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

  NomorUrut:= 0; {Lebih logis mulai dari 0}
  With Pegawai do
  While Not EOF(F) do {Ganti REPEAT UNTIL dengan WHILE NOT EOF}
  BEGIN
    Read(F, Pegawai);
    Inc(NomorUrut);
    WriteLn(Lst, #15, NomorUrut, Nama:22, Alamat:30, Umur:10);
  END;

  Close(F);
  WriteLn; Write('Tekan Enter untuk kembali ke menu...');
  Readln;
END;
}

{*** MENGGANTI NAMA SEMBARANG FILE ***}
PROCEDURE MenggantiNamaFile;
VAR NamaFile, NamaBaru:String[79];
    F_Sembarang:File; {Ganti nama variabel F}
BEGIN
  ClrScr;
  WriteLn('MENGGANTI NAMA FILE');
  WriteLn;
  Write('Ketik nama file yang akan diganti [Enter=Keluar]: ');
  Readln(NamaFile);
  If NamaFile='' then Exit;

  Assign(F_Sembarang, NamaFile);
  {$I-} Reset(F_Sembarang); {$I+}
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

  Close(F_Sembarang); { Tutup file terlebih dahulu }
  {$I-} Rename(F_Sembarang, NamaBaru); {$I+}
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
  WriteLn;
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


{**** KURSOR - DIHAPUS KARENA TIDAK KOMPATIBEL **** }
{
Procedure Kursor(AwalKursor,AkhirKursor:Byte);
Var Reg: Registers;
Begin
  Reg.AH := 1;
  Reg.CH := AwalKursor;
  Reg.CL := AkhirKursor;
  Intr($10, Reg);
End;
}

{=== PROGRAM UTAMA ===}
BEGIN
  Repeat
    HideCursor; {FIX 2: Mengganti Kursor(7,0)}
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
      #59 : Begin ShowCursor; BuatFileBaru; End; {FIX 2: Mengganti Kursor(0,7)}
      #60 : LihatSemuaData; {FIX 3: Menghapus 'End;'}
      #61 : Begin ShowCursor; CariDataLewatNomor; End; {FIX 2}
      #62 : Begin ShowCursor; CariDataLewatNama; End; {FIX 2}
      #63 : Begin ShowCursor; GantiDataLewatNomor; End; {FIX 2}
      #64 : Begin ShowCursor; GantiDataLewatNama; End; {FIX 2}
      #65 : Begin ShowCursor; HapusDataLewatNomor; End; {FIX 2}
      { #66 : CetakDataKePrinter; } {FIX 4: Dinonaktifkan}
      #67 : Begin ShowCursor; MenggantiNamaFile; End; {FIX 2}
      #68 : Begin ShowCursor; HapusFile; End; {FIX 2}
      #27 : Begin
              TextBackGround(0); Textattr:=7;
              TextColor(7); Window(1,1,80,25);
              ClrScr; ShowCursor; EXIT; {FIX 2: Mengganti Kursor(3,5)}
            End;
    End; {End Case}
    Sound(140); Delay(30);
    Sound(140); Delay(50); Nosound;
  Until False;
END.