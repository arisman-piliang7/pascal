PROGRAM PengenalanArray;
USES Crt;

VAR
  NilaiUjian : ARRAY[1..5] OF INTEGER; // 'Memesan' 5 laci untuk Integer

BEGIN
  ClrScr;

  // Mengisi data ke 'laci' (indeks) secara manual
  NilaiUjian[1] := 80;
  NilaiUjian[2] := 95;
  NilaiUjian[3] := 77;
  NilaiUjian[4] := 82;
  NilaiUjian[5] := 100;

  // Mengambil dan menampilkan data dari 'laci' tertentu
  Writeln('Nilai ujian siswa ke-2 adalah: ', NilaiUjian[2]); // Akan tampil 95
  Writeln('Nilai ujian siswa ke-5 adalah: ', NilaiUjian[5]); // Akan tampil 100

  Readln;
END.
