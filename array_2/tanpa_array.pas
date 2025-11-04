USES Crt;

VAR
  // 5 variabel integer terpisah
  Nilai1, Nilai2, Nilai3, Nilai4, Nilai5 : INTEGER; 

BEGIN
  ClrScr;

  // Mengisi data ke setiap variabel
  Nilai1 := 80;
  Nilai2 := 95;
  Nilai3 := 77;
  Nilai4 := 82;
  Nilai5 := 100;

  // Mengambil dan menampilkan data dari variabel
  Writeln('Nilai ujian siswa ke-2 adalah: ', Nilai2); // Akan tampil 95
  Writeln('Nilai ujian siswa ke-5 adalah: ', Nilai5); // Akan tampil 100

  Readln;
END.