import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/user/dashboardusercomponent.dart';
import 'package:mobileflutterkelompok4/screens/User/homeuserscreen.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mobileflutterkelompok4/screens/login/loginscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class dashboarduserscreen extends StatelessWidget {
  static String routeName = "/Dashboard_User";
  static var dataUser;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataUser = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Menu",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Homeuserscreen.routeName,
                arguments: Homeuserscreen.dataUser);
          },
          child: const Icon(
            Icons.home,
            color: mTitleColor,
          ),
        ),
        actions: [
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: dashboardusercomponent(),
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
                Navigator.pushNamed(context, Homeuserscreen.routeName,
                    arguments: Homeuserscreen.dataUser);
              },
              child: const Icon(
                Icons.home,
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
