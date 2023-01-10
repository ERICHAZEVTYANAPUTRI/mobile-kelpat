import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/screens/Admin/homeadminscreen.dart';
import 'package:mobileflutterkelompok4/screens/login/loginscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobileflutterkelompok4/components/admin/dashboardadmincomponent.dart.dart';
import 'package:mobileflutterkelompok4/screens/Admin/crud/inputanmenuscreen.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class dashboardadminscreen extends StatelessWidget {
  static var routeName = "/Dashboard_Admin";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Menu",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(
          Icons.home,
          color: mTitleColor,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, inputanmenuscreen.routeName);
            },
            child: Row(
              children: const [
                Icon(Icons.add, color: mTitleColor),
                Text(
                  "Tambah Menu",
                  style: TextStyle(
                      color: mTitleColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: dashboardadmincomponent(),
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
              child: Icon(Icons.home),
            ),
            GestureDetector(
              onTap: () {
                // utilsApps.showDialog(context);
                // Navigator.pushNamed(
                //     context, dashboardadminscreen.routeName);
              },
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

  setState(int Function() param0) {}
}
