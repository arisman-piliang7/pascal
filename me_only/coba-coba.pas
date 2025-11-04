USES Crt;
VAR
  NilaiUjian : ARRAY[1..5] OF INTEGER; //memesan 5 indeks untuk tipe data INTEGER
  i          : INTEGER; // variabel untuk loop
BEGIN
    ClrScr;
    FOR i := 1 TO 5 DO //ini adalah loop dari 1 sampai 5 yang nanti akan mengisi array yaitu NilaiUjian dari input user
    BEGIN
        Write('Masukkan nilai siswa ke-', i, ': '); // 'i' akan berisi 1, lalu 2, lalu 3, sampai 5 sesuai loop diatas
        Readln(NilaiUjian[i]); //ini mengisi array pada indeks ke-i diatas dengan nilai yang diinput
    END;
    Writeln; // Memberi spasi
    
    // --- 2. PROSES OUTPUT (MENAMPILKAN DATA) ---
    FOR i := 1 TO 5 DO //ini adalah loop dari 1 sampai 5 yang akan menampilkan isi array yaitu NilaiUjian
    BEGIN
        Writeln('Nilai siswa ke-', i, ' adalah: ', NilaiUjian[i]); //menampilkan isi array pada indeks ke-i
    END;

    Readln;
END.