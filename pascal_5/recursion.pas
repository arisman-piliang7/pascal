program DemoRekursi;
{$MODE DELPHI} // best mode for modern pascal
uses Crt;

var
  angka: integer;

// recursive function to calculate factorial
function Faktorial(n: integer): LongInt;
begin
  // 1. Base Case
  //    "Rem" dari rekursi. Jika n = 1, berhenti dan kembalikan 1.
  if n = 1 then
  begin
    Faktorial := 1;
  end

  // 2. Recursive Step
  //    if n > 1, call the function itself with n-
  else
  begin
    // Contoh: Faktorial(5) = 5 * Faktorial(4)
    Faktorial := n * Faktorial(n - 1); 
  end;
end;

// Program Utama
begin
  clrscr;
  
  Write('Masukkan angka untuk dihitung faktorialnya: ');
  Readln(angka);
  
  if angka < 0 then
    Writeln('Faktorial tidak terdefinisi untuk angka negatif.')
  else if angka = 0 then
    Writeln('Faktorial dari 0 adalah: 1')
  else
    Writeln('Hasil faktorial dari ', angka, ' adalah: ', Faktorial(angka));
    
  Readln;
end.