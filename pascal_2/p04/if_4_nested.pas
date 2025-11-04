program SapaNested;
uses Crt;
var
    Jam: Integer;
begin
    ClrScr;
    Write('Masukkan jam berapa sekarang (0-23): ');
    ReadLn(Jam);

    if (Jam >= 5) and (Jam < 12) then  { if luar }
    begin
        WriteLn('selamat pagi');

        if (Jam < 10) then               { if dalam }
            WriteLn('jangan lupa sarapan')
        else
            WriteLn('Bukan waktu sarapan');
    end
    else
        WriteLn('jam tidak terdaftar');

    ReadLn;
end.