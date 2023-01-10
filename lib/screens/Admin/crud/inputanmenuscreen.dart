import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/admin/crud/inputmenu/inputmenucomponent.dart';
import 'package:mobileflutterkelompok4/components/admin/dashboardadmincomponent.dart.dart';
import 'package:mobileflutterkelompok4/screens/Admin/DashaboardAdminscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class inputanmenuscreen extends StatelessWidget {
  static var routeName = 'inputdata';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Tambah Menu",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, dashboardadminscreen.routeName);
          },
          child: const Icon(
            Icons.arrow_back,
            color: mTitleColor,
          ),
        ),
      ),
      body: inputmenucomponent(),
    );
  }
}
