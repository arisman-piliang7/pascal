program ValidasiInput;
uses Crt, SysUtils; // SysUtils diperlukan untuk TryStrToInt

var
  InputStr: String;
  Jam: Integer;
  InputValid: Boolean;
  
begin
  ClrScr;
  Write('Masukkan jam berapa sekarang (0-23): ');
  ReadLn(InputStr);

  // 1. Coba konversi string ke integer
  InputValid := TryStrToInt(InputStr, Jam); 
  // Jika sukses, InputValid=True dan Jam=angkanya
  // Jika gagal (cth: "abc"), InputValid=False dan Jam=0

  if InputValid then
  begin
    // 2. Jika konversi sukses, cek jangkauan (range)
    if (Jam >= 0) and (Jam <= 23) then
    begin
      // --- LOGIKA PROGRAM UTAMA ---
      WriteLn('Input Anda valid: ', Jam);
      if (Jam >= 5) and (Jam < 12) then
        WriteLn('selamat pagi');
      
      WriteLn('program selesai');
      // ----------------------------
    end
    else
    begin
      // Gagal karena di luar jangkauan
      WriteLn('Input tidak valid: jam harus antara 0 dan 23');
    end;
  end
  else
  begin
    // Gagal karena format salah (bukan angka)
    WriteLn('Input tidak valid: Masukkan harus berupa angka.');
  end;
  
  ReadLn;
end.