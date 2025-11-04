program UnaryOperatorExample;
uses Crt;

var
  A, PlusA, MinusA: Integer;
  Flag, NotFlag: Boolean;
  C, D: Byte;
begin
  ClrScr;                        { Bersihkan layar (opsional) }
  { Unary plus and minus }
  A := 5;
  PlusA := +A;              { Unary plus tidak mengubah nilai }
  MinusA := -A;             { Unary minus membalik tanda }
  WriteLn('A = ', A);             (* Hasil: 5 *)
  WriteLn('+A = ', PlusA);        (* Hasil: 5 *)
  WriteLn('-A = ', MinusA);       (* Hasil: -5 *)

  { Unary NOT (boolean) }
  Flag := True;
  NotFlag := not Flag;
  WriteLn('Flag = ', Flag);       (* Hasil: TRUE *)
  WriteLn('not Flag = ', NotFlag);(* Hasil: FALSE *)

  { Unary NOT (bitwise pada tipe ordinal) }
  C := 5;                         { 0000 0101 (8-bit) }
  D := Byte(not C);               { 1111 1010 = 250 (8-bit) }
  WriteLn('not 5 (Byte) = ', D);  (* Hasil: 250 *)
  
  WriteLn;
  Write('Tekan sembarang tombol untuk keluar...');
  ReadKey;                        { Tahan layar (opsional) }
end.