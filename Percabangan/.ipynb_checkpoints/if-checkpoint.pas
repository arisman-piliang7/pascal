program PercabanganBiasa;

// 'Uses Crt;' biasanya diperlukan di Free Pascal atau Turbo Pascal
// untuk membersihkan layar (ClrScr) atau menahan layar (ReadLn).
// bisa saja mungkin tidak memerlukannya di compiler online.
uses Crt; 

var
  jam: integer;

begin
  Write('masukkan jam berapa sekarang (0-23): ');
  ReadLn(jam);

  WriteLn; // Membuat baris kosong setelah input

  WriteLn('=== TANPA ELSE ===');

  // Perbandingan '5 <= jam < 12' di Python
  // harus ditulis menggunakan operator 'AND' di Pascal.
  if (jam >= 5) AND (jam < 12) then
    WriteLn('selamat pagi');
  
  // Baris ini berada di luar kondisi 'if',
  // jadi akan selalu dieksekusi.
  WriteLn('program selesai');

  WriteLn; // Baris kosong (setara dengan print() di Python)

  // (Opsional) tambahkan ReadLn di sini jika jendela konsol
  // Anda langsung tertutup setelah program selesai.
  ReadLn; 
end.