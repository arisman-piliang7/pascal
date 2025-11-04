//program grafik pascal
program SapaPagiElse; //
uses Crt;
var
    Jam: Integer;
begin
    ClrScr;
    Write('Masukkan jam berapa sekarang (0-23): ');
    ReadLn(Jam);
    if (Jam >= 0) and (Jam < 12) then
        WriteLn('selamat pagi')
    else
        WriteLn('bukan waktu pagi');
    ReadLn;
end.
