import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileflutterkelompok4/screens/Admin/DashaboardAdminscreens.dart';
import 'package:mobileflutterkelompok4/screens/Admin/dataallpesananuser.dart';
import 'package:mobileflutterkelompok4/screens/Admin/datauserterdaftar.dart';
import 'package:mobileflutterkelompok4/screens/login/loginscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homeadminscreen extends StatefulWidget {
  @override
  State<Homeadminscreen> createState() => _HomeadminscreenState();
  static var routeName = "/home_admin";
}

class _HomeadminscreenState extends State<Homeadminscreen> {
  int index = 0;
  final screens = [
    Center(child: Text('Menu', style: TextStyle(fontSize: 72))),
    Center(child: Text('Keluar', style: TextStyle(fontSize: 72))),
    Center(child: Text('Reservasi', style: TextStyle(fontSize: 72))),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/top_header.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SimpleShadow(
                    child: Image.asset(
                      "assets/images/diet.png",
                      height: 150,
                      width: 202,
                    ),
                    opacity: 0.5,
                    color: kSecondaryColor,
                    offset: Offset(5, 5),
                    sigma: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, dashboardadminscreen.routeName);
                          },
                          child: Container(
                            child: Card(
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    'https://freesvg.org/img/fast-food-menu.png',
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Menu Makanan",
                                    style: TextStyle(
                                        color: mTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Card(
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    'https://freesvg.org/img/rihard_Clock_Calendar_3.png',
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Reservasi",
                                    style: TextStyle(
                                        color: mTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Allpesananuserscreen.routeName);
                          },
                          child: Container(
                            child: Card(
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    'https://freesvg.org/img/notas-colour.png',
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Pesanan User",
                                    style: TextStyle(
                                        color: mTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, userterdaftarscreen.routeName);
                          },
                          child: Container(
                            child: Card(
                              elevation: 30,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.network(
                                    'https://freesvg.org/img/1529053671.png',
                                    height: 100,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "User Terdaftar",
                                    style: TextStyle(
                                        color: mTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade200,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          // selectedIndex: index,
          // onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            GestureDetector(
              onTap: () {
                utilsApps.showDialog(context);
                Navigator.pushNamed(context, dashboardadminscreen.routeName);
              },
              child: const Icon(
                Icons.list,
                color: Color.fromARGB(255, 20, 20, 20),
              ),
            ),
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
              onTap: () {},
              child: const Icon(
                Icons.list,
                color: Color.fromARGB(255, 20, 20, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
