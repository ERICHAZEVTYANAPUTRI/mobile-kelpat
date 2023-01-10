import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/admin/crud/editmenu/editmenucomponent.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class editmenuscreen extends StatelessWidget {
  static var routeName = 'editmenu';
  static var datamenu;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    datamenu = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Menu",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: editmenucomponent(),
    );
  }
}
