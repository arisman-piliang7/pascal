uses crt;

const
  MAX = 100;

var
  arr: array[1..MAX] of integer;
  n, i: integer;

begin
  clrscr;

  write('Masukkan jumlah elemen (1..', MAX, '): ');
  readln(n);
  if (n < 1) or (n > MAX) then
  begin
    writeln('Jumlah elemen tidak valid.'); readln; exit; //readln; exit; ini untuk menghentikan program jika input tidak valid
  end;

  for i := 1 to n do
  begin
    write('Masukkan data ke-', i, ': ');
    readln(arr[i]); //membaca input dan menyimpannya di arr[i], arr[1] itu adalah elemen pertama
  end;

  writeln;
  writeln('Data yang telah dimasukkan:');
  for i := 1 to n do
    write(arr[i]:3); //3 adalah lebar tampilan untuk setiap elemen

  writeln;
  write('Tekan Enter untuk keluar...');
  readln;
end.
