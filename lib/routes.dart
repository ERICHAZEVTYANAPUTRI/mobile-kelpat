import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/screens/Admin/DashaboardAdminscreens.dart';
import 'package:mobileflutterkelompok4/screens/Admin/crud/editmenuscreen.dart';
import 'package:mobileflutterkelompok4/screens/Admin/crud/inputanmenuscreen.dart';
import 'package:mobileflutterkelompok4/screens/Admin/dataallpesananuser.dart';
import 'package:mobileflutterkelompok4/screens/Admin/datauserterdaftar.dart';
import 'package:mobileflutterkelompok4/screens/Admin/homeadminscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/DashboardUserscreens.dart';
import 'package:mobileflutterkelompok4/screens/User/abouteuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/homeuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/reservasiuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/tempatpesananuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/transaksi/transaksiscreen.dart';
import 'package:mobileflutterkelompok4/screens/login/loginscreens.dart';
import 'package:mobileflutterkelompok4/screens/register/registerscreens.dart';

final Map<String, WidgetBuilder> routes = {
  //punya login dan register
  loginscreen.routeName: (context) => loginscreen(),
  registerscreen.routeName: (context) => registerscreen(),

  //punya halaman user
  dashboarduserscreen.routeName: (context) => dashboarduserscreen(),
  Homeuserscreen.routeName: (context) => Homeuserscreen(),
  reservasiuserscreen.routeName: (context) => reservasiuserscreen(),
  transaksiscreen.routeName: (context) => transaksiscreen(),
  pesananuserscreen.routeName: (context) => pesananuserscreen(),
  abouteuserscreen.routeName: (context) => abouteuserscreen(),

  //punya halaman admin
  Homeadminscreen.routeName: (context) => Homeadminscreen(),
  dashboardadminscreen.routeName: (context) => dashboardadminscreen(),
  inputanmenuscreen.routeName: (context) => inputanmenuscreen(),
  editmenuscreen.routeName: (context) => editmenuscreen(),
  userterdaftarscreen.routeName: (context) => userterdaftarscreen(),
  Allpesananuserscreen.routeName: (context) => Allpesananuserscreen()
};
