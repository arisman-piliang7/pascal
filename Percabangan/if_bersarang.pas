program PercabanganBersarang;

uses Crt; 

var
  jam: integer;

begin
  Write('masukkan jam berapa sekarang (0-23): ');
  ReadLn(jam);
  WriteLn; // Baris kosong

  // -- Ini adalah IF Pertama (Luar) --
  if (jam >= 5) AND (jam < 12) then
  begin
    WriteLn('selamat pagi');

    // -- Ini adalah IF Kedua (Bersarang/Nested) --
    // IF ini hanya akan diperiksa jika IF Pertama bernilai TRUE.
    if (jam < 10) then
    begin
      WriteLn('jangan lupa sarapan');
    end
    else
    begin
      WriteLn('Bukan waktu sarapan'); // Ini blok ELSE dari IF Kedua
    end;
    // -- Akhir dari IF Kedua --

  end
  else
  begin
    WriteLn('jam tidak terdaftar'); // Ini blok ELSE dari IF Pertama
  end;
  // -- Akhir dari IF Pertama --

  // (Opsional) tambahkan ReadLn di sini
  ReadLn;
end.