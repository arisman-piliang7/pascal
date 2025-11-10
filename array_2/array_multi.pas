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

  for i := 1 to r do //ini adalah loop baris akan menghasilkan iterasi dari 1 sampai r
    for j := 1 to c do //ini adalah loop kolom akan menghasilkan iterasi dari 1 sampai c
    begin
      write('Masukkan data [', i, ',', j, '] : '); //ini adalah prompt untuk memasukkan data pada posisi [i,j]
      readln(arr[i, j]); //ini adalah pembacaan data yang dimasukkan ke dalam array pada posisi [i,j]
    end;

  writeln;
  writeln('Matriks yang telah dimasukkan:');
  for i := 1 to r do //ini adalah loop baris untuk menampilkan data
  begin
    for j := 1 to c do //ini adalah loop kolom untuk menampilkan data
      write(arr[i, j]:6); //menampilkan data pada posisi [i,j] dengan lebar 6 karakter
    writeln; //pindah ke baris berikutnya setelah menampilkan satu baris data
  end;

  writeln; //menambahkan baris kosong sebelum prompt keluar
  write('Tekan Enter untuk keluar...'); //ini adalah prompt untuk keluar
  readln; //menunggu input Enter sebelum keluar
end.