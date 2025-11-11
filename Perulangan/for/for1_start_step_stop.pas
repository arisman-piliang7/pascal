//Perulangan for standar di Pascal (for i := 1 to 10 do) tidak bisa memiliki "langkah" (step) 
//kustom selain +1 (atau -1 jika pakai downto).

program PerulanganDownto;

uses Crt;

var
  i: integer;

begin
  // 'for i := 10 downto 1 do'
  // Ini adalah cara Pascal untuk menghitung mundur
  // dari 10 ke 1, dengan langkah -1.
  
  for i := 10 downto 1 do //1 to 10 do [step +1]
  begin
    WriteLn('Pemrograman Komputer ', i);
  end;

  // ReadLn;
end.