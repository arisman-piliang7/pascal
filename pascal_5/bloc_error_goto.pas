program DemoInputValidasiGoto;
{$MODE DELPHI}
uses Crt;

label
  InputUlang; // this is label declaration

var
  umur: integer;
  inputStr: string;
  code: integer;

begin
  clrscr;

InputUlang:
  Write('Silakan masukkan umur Anda: ');
  Readln(inputStr);

  Val(inputStr, umur, code); // conversion string to integer

  if code <> 0 then //failed conversion example: 'abc'
  begin
    Writeln;
    Writeln('ERROR: Input tidak valid. Harap masukkan ANGKA saja.');
    Writeln;
    goto InputUlang; // jump to label InputUlang
  end;

  Writeln('Terima kasih. Umur Anda adalah ', umur, ' tahun.');
  Readln;
end.
