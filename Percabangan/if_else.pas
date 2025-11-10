program PercabanganElse;

uses Crt; 

var
  jam: integer;

begin
  Write('masukkan jam berapa sekarang (0-23): ');
  ReadLn(jam);

  WriteLn; // Baris kosong

  WriteLn('=== DENGAN ELSE ===');

  // Struktur if-then-else di Pascal
  if (jam >= 5) AND (jam < 12) then
  begin
    WriteLn('selamat pagi');
  end
  else
  begin
    // Perintah ini dieksekusi jika kondisi 'if' tidak terpenuhi (false)
    WriteLn('bukan waktu pagi');
  end;
  
  // (Opsional) tambahkan ReadLn di sini jika jendela konsol
  // Anda langsung tertutup setelah program selesai.
  // ReadLn; 
end.