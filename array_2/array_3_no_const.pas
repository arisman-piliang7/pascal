PROGRAM ArrayDenganLoopEfisien;
USES Crt;

VAR
  NilaiUjian : ARRAY[1..5] OF INTEGER; //ini adalah array untuk menyimpan nilai ujian
  i          : INTEGER; // Variabel 'counter' untuk loop

BEGIN
  ClrScr;

  // --- 1. PROSES INPUT (MENGISI DATA) ---
  //  ganti 5 baris manual dengan 1 loop
  Writeln('--- Masukkan ', i, ' Nilai Ujian ---'); //i di sini berasal dari perulangan yang akan datang
  FOR i := 1 TO 5 DO //ini adalah loop dari 1 sampai 5 yang akan mengisi array yaitu NilaiUjian
  BEGIN
    Write('Masukkan nilai siswa ke-', i, ': ');
    // 'i' akan berisi 1, lalu 2, lalu 3, dst.
    // Kita gunakan 'i' sebagai indeks array
    Readln(NilaiUjian[i]); //ini mengisi array pada indeks ke-i dengan nilai yang diinput
  END;

  Writeln; // Memberi spasi

  // --- 2. PROSES OUTPUT (MENAMPILKAN DATA) ---
  // Kita tampilkan semua nilai, tidak hanya 2 dan 5
  Writeln('--- Daftar Lengkap Nilai Ujian ---');
  FOR i := 1 TO 5 DO
  BEGIN
    Writeln('Nilai siswa ke-', i, ' adalah: ', NilaiUjian[i]);
  END;

  Readln;
END.