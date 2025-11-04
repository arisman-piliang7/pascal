program PendaftaranPasien;

uses
  Crt; // Modul untuk Clear Screen (ClrScr)

// 1. Deklarasi Konstanta (data yang tidak berubah)
const
  NAMA_KLINIK   = 'Klinik Mikroskil';
  ALAMAT_KLINIK = 'Jl. Mikroskil No. 1, Medan';

// 2. Deklarasi Variabel (data yang akan diisi user)
// Kita daftarkan semua 'kotak' yang kita butuhkan
var
  NOMOR_ANTRIAN,
  NAMA_PASIEN,
  ALAMAT,
  POLI,
  JENIS_LAYANAN,
  KELUHAN,
  TANGGAL_KUNJUNG,
  ADMIN             : String;  // Variabel bertipe teks
  
  UMUR              : Integer; // Variabel bertipe angka bulat
  
  SUHU_BADAN,
  BERAT_BADAN       : Real;    // Variabel bertipe angka desimal (float) 

// 3. Program Utama Dimulai
begin
  ClrScr; // Bersihkan layar terminal

  // Menampilkan informasi klinik (dari konstanta)
  WriteLn(NAMA_KLINIK);
  WriteLn(ALAMAT_KLINIK);
  WriteLn('================================');
  WriteLn; // Memberi satu baris spasi kosong
  
  // 4. Proses Input Data dari User
  // Kita gunakan Write() agar kursor tetap di baris yang sama
  Write('Masukkan Nomor Antrian: ');
  ReadLn(NOMOR_ANTRIAN); // Membaca input dan menyimpannya di var NOMOR_ANTRIAN
  
  Write('Masukkan Nama Pasien: ');
  ReadLn(NAMA_PASIEN);
  
  Write('Masukkan Umur Pasien: ');
  ReadLn(UMUR); // Otomatis membaca sebagai Integer
  
  Write('Masukkan Alamat Pasien: ');
  ReadLn(ALAMAT);
  
  Write('Masukkan Poli yang dituju: ');
  ReadLn(POLI);
  
  Write('Masukkan Jenis Layanan: ');
  ReadLn(JENIS_LAYANAN);
  
  Write('Masukkan Suhu Badan Pasien: ');
  ReadLn(SUHU_BADAN); // Otomatis membaca sebagai Real
  
  Write('Masukkan Berat Badan Pasien: ');
  ReadLn(BERAT_BADAN); // Otomatis membaca sebagai Real
  
  Write('Masukkan Keluhan Pasien: ');
  ReadLn(KELUHAN);
  
  Write('Masukkan Tanggal Kunjungan (DD-MM-YYYY): ');
  ReadLn(TANGGAL_KUNJUNG);
  
  Write('Masukkan Nama Admin: ');
  ReadLn(ADMIN);

  // 5. Menampilkan Hasil Output
  WriteLn; // Spasi
  WriteLn('--- Data Pasien Telah Tercatat ---');
  WriteLn('================================');
  WriteLn('Nomor Antrian: ', NOMOR_ANTRIAN);
  WriteLn('Nama Pasien: ', NAMA_PASIEN);
  WriteLn('Umur Pasien: ', UMUR, ' tahun'); // Menggabungkan teks dan variabel
  WriteLn('Alamat Pasien: ', ALAMAT);
  WriteLn('Poli yang dituju: ', POLI);
  WriteLn('Jenis Layanan: ', JENIS_LAYANAN);
  WriteLn('Suhu Badan Pasien: ', SUHU_BADAN:0:1, ' derajat Celsius'); // Format :0:1 = 1 angka desimal
  WriteLn('Berat Badan Pasien: ', BERAT_BADAN:0:1, ' kg'); // Format :0:1 = 1 angka desimal
  WriteLn('Keluhan Pasien: ', KELUHAN);
  WriteLn('Tanggal Kunjungan: ', TANGGAL_KUNJUNG);
  WriteLn('Nama Admin: ', ADMIN);
  
  WriteLn;
  Write('Tekan Enter untuk keluar...');
  ReadLn; // Menjeda program agar hasilnya terbaca
  
end.