var
  A, B: Integer;
  Str1, Str2: String;
begin
  A := 10;
  B := 5;
  Str1 := 'hello';
  Str2 := 'world';
  
  WriteLn('A = B : ', A = B);       (* False *)
  WriteLn('A <> B : ', A <> B);      (* True *)
  WriteLn('A > B : ', A > B);       (* True *)
  WriteLn('Str1 < Str2 : ', Str1 < Str2); (* True, 'h' < 'w' *)
end.