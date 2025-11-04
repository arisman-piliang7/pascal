program DemoGrafik;
{$mode objfpc}{$H+}
{$ifdef HAS_GRAPH}
{$define USES_GRAPH}
{$endif}
uses
  Crt
  {$ifdef USES_GRAPH}, Graph{$endif};

var
  {$ifdef USES_GRAPH}
  gd, gm: Integer;         // gd = Graphics Driver, gm = Graphics Mode
  i: Integer;
  x, y, radius: Integer;
  maxX, maxY: Integer;
  ErrCode: Integer;
  {$endif}

procedure RunAsciiFallback;
var
  i: Integer;
begin
  ClrScr;
  WriteLn('Grafik (unit Graph) tidak tersedia. Menjalankan fallback ASCII...');
  WriteLn('Menampilkan 10 lingkaran "palsu" (garis melingkar) dalam teks:');
  WriteLn;
  for i := 1 to 10 do
  begin
    WriteLn('• Lingkaran ke-', i:2, ' di (', Random(80):2, ',', Random(24):2, ') radius ', Random(10)+3);
    Delay(50);
  end;
  WriteLn('\nTekan sembarang tombol untuk keluar...');
  ReadKey;
end;

begin
  Randomize;
  {$ifdef USES_GRAPH}
  // 1) Inisialisasi Mode Grafis (auto-detect). Argumen path BGI dikosongkan di Linux.
  gd := Detect;
  gm := 0;
  InitGraph(gd, gm, '');

  // 2) Cek status grafis
  ErrCode := GraphResult;
  if ErrCode <> grOk then
  begin
    // Tidak memaksa error; gunakan fallback ASCII agar tetap bisa berjalan.
    RunAsciiFallback;
    Halt(0);
  end;

  // 3) Dapatkan ukuran layar
  maxX := GetMaxX;
  maxY := GetMaxY;

  // 4) Teks judul
  SetTextStyle(DefaultFont, HorizDir, 2);
  SetColor(White);
  OutTextXY(20, 20, 'Demo Grafik Pascal (FPC Graph)');

  // 5) Demo: 200 lingkaran acak
  for i := 1 to 200 do
  begin
    SetColor(Random(15));
    x := Random(maxX);
    y := Random(maxY);
    radius := Random(60) + 10;
    Circle(x, y, radius);
    Delay(20);
  end;

  // 6) Tahan layar dan tutup
  OutTextXY(20, maxY - 30, 'Tekan sembarang tombol untuk keluar...');
  ReadKey;
  CloseGraph;
  {$else}
  // Tanpa unit Graph, langsung jalankan fallback
  RunAsciiFallback;
  {$endif}
end.