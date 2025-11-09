uses crt;

const
  MAXR = 50;
  MAXC = 50;

var
  arr: array[1..MAXR, 1..MAXC] of integer;
  r, c, i, j: integer;

begin
  clrscr;

  write('Masukkan jumlah baris (1..', MAXR, '): ');
  readln(r);
  if (r < 1) or (r > MAXR) then
  begin
    writeln('Jumlah baris tidak valid.'); readln; exit;
  end;

  write('Masukkan jumlah kolom (1..', MAXC, '): ');
  readln(c);
  if (c < 1) or (c > MAXC) then
  begin
    writeln('Jumlah kolom tidak valid.'); readln; exit;
  end;

  for i := 1 to r do
    for j := 1 to c do
    begin
      write('Masukkan data [', i, ',', j, '] : ');
      readln(arr[i, j]);
    end;

  writeln;
  writeln('Matriks yang telah dimasukkan:');
  for i := 1 to r do
  begin
    for j := 1 to c do
      write(arr[i, j]:6);
    writeln;
  end;

  writeln; write('Tekan Enter untuk keluar...'); readln;
end.