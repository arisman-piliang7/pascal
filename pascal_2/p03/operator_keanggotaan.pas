//Di Python, operator in dan not in sangat serbaguna. 
//Anda bisa menggunakannya untuk memeriksa string, list, tuple, set, dan keys dictionary.
//Di Pascal, operator in HANYA bekerja pada tipe data Set.
//Set adalah kumpulan nilai unik. Anda harus mendeklarasikannya terlebih dahulu
//Bagaimana cara memeriksa in di String? Anda tidak bisa. Anda harus menggunakan fungsi Pos() (Position) untuk mencari substring


var
  // Membuat tipe data Set yang hanya boleh berisi angka 1 sampai 10
  SetAngka: set of 1..10;
begin
  // Mengisi Set dengan nilai
  SetAngka := [1, 3, 5, 7, 9];
  
  // Memeriksa keanggotaan
  WriteLn('Apakah 3 ada di Set? ', 3 in SetAngka);   (* True *)
  WriteLn('Apakah 2 ada di Set? ', 2 in SetAngka);   (* False *)
  
  // Untuk "not in", Anda gunakan not ... in
  WriteLn('Apakah 2 TDK ada di Set? ', not (2 in SetAngka)); (* True *)
end.