program SapaPagiElse; //
uses Crt;
var
  Jam: Integer; 
begin
  ClrScr;
  Write('Masukkan jam berapa sekarang (0-23): ');
  ReadLn(Jam);
  
  WriteLn('=== DENGAN ELSE ===');
  
  if (Jam >= 5) and (Jam < 12) then
    WriteLn('selamat pagi')  // <-- TIDAK ADA ; di sini
  else
    WriteLn('bukan waktu pagi'); // <-- ; baru diletakkan di akhir
  
  ReadLn;
