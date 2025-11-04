PROGRAM ContohArrayDinamis;
USES SysUtils;

TYPE
  TArrayInt = ARRAY OF INTEGER;

VAR
  Nilai: TArrayInt;
  i, Jumlah: INTEGER;

BEGIN
  Write('Masukkan jumlah data: ');
  Readln(Jumlah);

  SetLength(Nilai, Jumlah); // Alokasi memori dinamis

  FOR i := 0 TO Jumlah - 1 DO
  BEGIN
    Write('Nilai ke-', i + 1, ': ');
    Readln(Nilai[i]);
  END;

  Writeln('Data yang dimasukkan:');
  FOR i := 0 TO Jumlah - 1 DO
    Writeln('Nilai[', i, '] = ', Nilai[i]);

  Readln;
END.
