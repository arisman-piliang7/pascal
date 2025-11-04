var
  X, Y: Boolean;
begin
  X := True;
  Y := False;
  
  WriteLn('X and Y = ', X and Y); (* False *)
  WriteLn('X or Y = ', X or Y);  (* True *)
  WriteLn('not X = ', not X);     (* False *)
end.