String baseUrl = 'http://localhost:5001';
//String baseUrl = 'http://192.168.1.9:5001';

//AUTH
String urlRegister = '$baseUrl/user/register';
String urllogin = '$baseUrl/user/login';

//crud menu
String inputmenu = '$baseUrl/menu/create';
String editmenu = '$baseUrl/menu/edit';
String getallmenu = '$baseUrl/menu/getall';
String hapusmenu = '$baseUrl/menu/hapus';
String getbyidmenu = '$baseUrl/menu/getbyid';
String getalluser = '$baseUrl/user/getall';
String getalldata = '$baseUrl/transaksi/getall';
String hapususer = '$baseUrl/user/hapus';

//transaksiuser
String createTransaksi = '$baseUrl/transaksi/create';
String getTransaksiUser = '$baseUrl/transaksi/getbyiduser';
String getTransaksiUserLimit = '$baseUrl/transaksi/getbyiduserlimit';
String uploadBuktiPembayaran = '$baseUrl/transaksi/upload-bukti';
