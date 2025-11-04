var
  A, B: Byte; // Byte adalah Integer 0..255
begin
  A := 5;  (* Biner: 00000101 *)
  B := 10; (* Biner: 00001010 *)
  
  WriteLn('A and B = ', A and B); (* 00000000 -> 0 *)
  WriteLn('A or B = ', A or B);  (* 00001111 -> 15 *)
  WriteLn('A xor B = ', A xor B); (* 00001111 -> 15 *)
  WriteLn('A shl 1 = ', A shl 1); (* 00001010 -> 10 *)
end.