program PerulanganFor;

uses Crt;

var
  i: integer;

begin
  // 'range(1, 11)' di Python setara dengan
  // 'for i := 1 to 10 do' di Pascal.
  
  // Loop akan mulai dari i = 1
  // dan berhenti setelah i = 10.
  
  for i := 1 to 10 do
  begin
    WriteLn('Pemrograman Komputer ', i);
  end;

  // ReadLn;
end.