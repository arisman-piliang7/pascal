program DemoInputValidasi;
{$MODE DELPHI}
uses Crt, SysUtils; //for handling EInOutError exception

var
  umur: integer;
  inputOK: boolean;

begin
  clrscr;
  
  inputOK := false; // sign first that if input notyet valid
  
  repeat //like while true in py, it will keep repeating until true
    try
      Write('Silakan masukkan umur Anda: ');
      Readln(umur);

      // if Readln(umur) success, program will continue here
      inputOK := true; // if input true exit from loop like a break statement
      
    //error handling here
    except //capture the error
      on EInOutError do //error notif casual is EInOutError
      begin
        Writeln;
        Writeln('ERROR: Input tidak valid. Harap masukkan ANGKA saja.');
        Writeln;
        inputOK := false; //output false to repeat the loop
      end;
    end;
    
  until inputOK; // out from loop if only inputOK = true

  Writeln('Terima kasih. Umur Anda adalah ', umur, ' tahun.');
  Readln;
end.