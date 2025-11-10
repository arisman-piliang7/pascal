program PerulanganWhile;

uses Crt;

var
  i: integer;

begin
  // 1. Inisialisasi (Start):
  i := 1; 

  // 2. Kondisi (Stop-1):
  // Loop berlanjut selama i < 11 (sama seperti logika Python)
  while (i < 11) do
  begin
    // f-string di Python setara dengan WriteLn dan variabel
    WriteLn('Pemrograman Komputer ', i); 
    
    // 3. Langkah (Step):
    // Tambahkan 'i' dengan 2 di setiap akhir perulangan
    i := i + 2; 
  end;

  // ReadLn;
end.