program PerulanganForSederhana;

uses Crt;

var
  i: integer;

begin
  // 'range(1)' di Python berarti:
  // Mulai dari 0, berhenti SEBELUM 1.
  // Jadi, loop hanya berjalan untuk i = 0.
  
  // Di Pascal, cara untuk 'berjalan hanya untuk i = 0'
  // adalah 'for i := 0 to 0 do'.
  
  for i := 0 to 0 do
  begin
    // 'WriteLn' tanpa spasi di string akan langsung
    // menggabungkan string dengan nilai 'i'.
    WriteLn('Pemrograman Komputer', i);
  end;

  // ReadLn;
end.