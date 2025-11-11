program DemoInputValidasi;
{$MODE DELPHI}
uses Crt, SysUtils; //for handling EInOutError exception

var
  umur: integer;
  inputOK: boolean;

begin
  clrscr;
  
  inputOK := false; // Set 'false' to start the loop
  

  repeat //like while true in py, it will keep repeating until break
    try
      Write('Silakan masukkan umur Anda: ');
      Readln(umur);

      // if Readln(umur) success, program will continue here
      inputOK := true; // Set 'true' to exit loop
      
    except //capture the error
      on EInOutError do // Menangkap error JIKA user mengetik 'abc'
      begin
        Writeln;
        Writeln('ERROR: Input tidak valid. Harap masukkan ANGKA saja.');
        Writeln;
        inputOK := false; //ini gunanya agar loop diulang lagi
      end;
    end;
    
  until inputOK; // out from loop f only inputOK = true

  Writeln('Terima kasih. Umur Anda adalah ', umur, ' tahun.');
  Readln;
end.