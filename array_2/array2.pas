PROGRAM ArrayDenganLoopEfisien;
USES Crt;

CONST
  JumlahSiswa = 5; // Menggunakan konstanta lebih rapi!

VAR
  NilaiUjian : ARRAY[1..JumlahSiswa] OF INTEGER;
  i          : INTEGER; // Variabel 'counter' untuk loop

BEGIN
  ClrScr;

  // --- 1. PROSES INPUT (MENGISI DATA) ---
  // Kita ganti 5 baris manual dengan 1 loop
  Writeln('--- Masukkan ', JumlahSiswa, ' Nilai Ujian ---');
  FOR i := 1 TO JumlahSiswa DO
  BEGIN
    Write('Masukkan nilai siswa ke-', i, ': ');
    // 'i' akan berisi 1, lalu 2, lalu 3, dst.
    // Kita gunakan 'i' sebagai indeks array
    Readln(NilaiUjian[i]);
  END;

  Writeln; // Memberi spasi

  // --- 2. PROSES OUTPUT (MENAMPILKAN DATA) ---
  // Kita tampilkan semua nilai, tidak hanya 2 dan 5
  Writeln('--- Daftar Lengkap Nilai Ujian ---');
  FOR i := 1 TO JumlahSiswa DO
  BEGIN
    Writeln('Nilai siswa ke-', i, ' adalah: ', NilaiUjian[i]);
  END;

  Readln;
END.