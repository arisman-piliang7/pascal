if (Jam >= 5) and (Jam < 12) then
  WriteLn('selamat pagi')

else if (Jam >= 12) and (Jam < 15) then // Ini adalah 'elif'
  WriteLn('selamat siang')

else if (Jam >= 15) and (Jam < 18) then
  WriteLn('selamat sore')

else if ((Jam >= 18) and (Jam <= 23)) or ((Jam >= 0) and (Jam < 5)) then
  WriteLn('selamat malam')

else
  WriteLn('jam tidak valid');