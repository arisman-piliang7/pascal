program SapaLengkap;
uses Crt;
var
  Jam: Integer;
begin
  ClrScr;
  Write('Masukkan jam berapa sekarang (0-23): ');
  ReadLn(Jam);

  case Jam of
    5..11 : WriteLn('selamat pagi');   // Rentang 5 s/d 11
    12..14: WriteLn('selamat siang');  // Rentang 12 s/d 14
    15..17: WriteLn('selamat sore');   // Rentang 15 s/d 17
    18..23, 0..4 : WriteLn('selamat malam'); // Rentang gabungan
  else
    WriteLn('jam tidak valid'); // Mirip 'else' di 'if'
  end; // Akhir dari 'case'

  ReadLn;
end.