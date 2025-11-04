var
  A, B: Integer;
  X, Y: Real;
begin
  A := 10;
  B := 3;
  
  WriteLn('A + B = ', A + B);         (* Hasil: 13 *)
  WriteLn('A - B = ', A - B);         (* Hasil: 7 *)
  WriteLn('A * B = ', A * B);         (* Hasil: 30 *)
  
  WriteLn('A / B = ', A / B :0:2);     (* Hasil: 3.33 (Tipe Real) *)
  WriteLn('A div B = ', A div B);     (* Hasil: 3 (Tipe Integer) *)
  WriteLn('A mod B = ', A mod B);     (* Hasil: 1 (Sisa bagi) *)
end.