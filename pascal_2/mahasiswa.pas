PROGRAM ArrayRecord;
USES Crt;

// 1. Definisikan 'cetakan' datanya dulu
TYPE
  TSiswa = RECORD
    NIM   : STRING[10];
    Nama  : STRING[50];
    Nilai : INTEGER;
  END;

VAR
  // 2. Buat array yang isinya adalah 'cetakan' tadi
  DataKelas : ARRAY[1..3] OF TSiswa;
  i         : INTEGER;

BEGIN
  ClrScr;

  // --- Proses Input ---
  Writeln('--- Input Data 3 Siswa ---');
  FOR i := 1 TO 3 DO
  BEGIN
    Writeln('Data Siswa ke-', i);
    Write('  NIM   : '); Readln(DataKelas[i].NIM);
    Write('  Nama  : '); Readln(DataKelas[i].Nama);
    Write('  Nilai : '); Readln(DataKelas[i].Nilai);
    Writeln;
  END;

  // --- Proses Output ---
  Writeln('--- Laporan Data Kelas ---');
  Writeln('--------------------------------------------------');
  Writeln('No.'#9'NIM'#9#9'Nama'#9#9#9'Nilai');
  Writeln('--------------------------------------------------');

  FOR i := 1 TO 3 DO
  BEGIN
    Writeln(i, #9,
            DataKelas[i].NIM, #9#9,
            DataKelas[i].Nama, #9#9,
            DataKelas[i].Nilai);
  END;

  Readln;
END.