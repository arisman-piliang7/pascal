uses crt;

var
  x : array [1..100] of integer;
  i, n : integer;

begin
  clrscr;

  write('Masukkan banyak data yang ingin diinput: ');
  readln(n);

  for i := 1 to n do
  begin
    write('Masukkan data ke-', i, ' : ');
    readln(x[i]);
  end;

  writeln('Data yang telah dimasukkan:');
  for i := 1 to n do
    writeln('x[', i, '] = ', x[i]);

end.
