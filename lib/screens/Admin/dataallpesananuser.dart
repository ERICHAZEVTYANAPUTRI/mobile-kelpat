import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/admin/allpesananusercomponent.dart';
import 'package:mobileflutterkelompok4/components/user/dashboardusercomponent.dart';
import 'package:mobileflutterkelompok4/components/user/reservasiusercomponent.dart';
import 'package:mobileflutterkelompok4/components/user/transaksi/datahasiltransaksi.dart/datahasiltransaksicomponent.dart';
import 'package:mobileflutterkelompok4/screens/Admin/homeadminscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/homeuserscreen.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mobileflutterkelompok4/screens/login/loginscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class Allpesananuserscreen extends StatelessWidget {
  static String routeName = "/AllPesanan_User";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Semua Pesanan User",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(
          Icons.home,
          color: mTitleColor,
        ),
        actions: [
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: allpesananuserComponents(),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade200,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            GestureDetector(
              onTap: () {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Yakin Ingin Logout ?...',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              },
              child: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 20, 20, 20),
              ),
            ),
            GestureDetector(
              onTap: () {
                utilsApps.showDialog(context);
                Navigator.pushNamed(context, Homeadminscreen.routeName);
              },
              child: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 20, 20, 20),
              ),
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Badge(
            //     badgeContent: Icon(
            //       Icons.shopping_cart_outlined,
            //       color: Color.fromARGB(255, 0, 0, 0),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Badge(
      //     badgeContent: Text(
      //       '20',
      //       style: TextStyle(
      //           color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      //     ),
      //     child: Icon(
      //       Icons.shopping_cart_outlined,
      //       color: Color.fromARGB(255, 245, 255, 246),
      //     ),
      //   ),
      // ),
    );
  }

  setState(int Function() param0) {}
}
