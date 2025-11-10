program PercabanganBertingkat;

uses Crt; 

var
  jam: integer;

begin
  Write('masukkan jam berapa sekarang (0-23): ');
  ReadLn(jam);
  WriteLn; // Baris kosong

  // Di Pascal, 'elif' ditulis sebagai 'else if'
  
  if (jam >= 5) AND (jam < 12) then
    WriteLn('selamat pagi') // Pemeriksaan pertama
  
  else if (jam >= 12) AND (jam < 15) then
    WriteLn('selamat siang') // Pemeriksaan kedua
  
  else if (jam >= 15) AND (jam < 18) then
    WriteLn('selamat sore') // Pemeriksaan ketiga

  // Perhatikan penggunaan kurung untuk 'OR' agar logikanya jelas
  else if ((jam >= 18) AND (jam <= 23)) OR ((jam >= 0) AND (jam < 5)) then
    WriteLn('selamat malam') // Pemeriksaan keempat
  
  else
    WriteLn('jam tidak valid'); // Ini jika semua pemeriksaan di atas salah
  
  // (Opsional) tambahkan ReadLn di sini jika jendela konsol
  // Anda langsung tertutup setelah program selesai.
  // ReadLn; 
end.