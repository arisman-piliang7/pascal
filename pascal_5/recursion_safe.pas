procedure rekursi(n: integer);
begin
  if n > 0 then //f recursion reach=[0] then stop pascal[5]...pascal[0]
  begin
    Write('pascal ');
    rekursi(n - 1);
  end;
end;

begin
  rekursi(5); // cetak "pascal" sebanyak 5 kali
end.
