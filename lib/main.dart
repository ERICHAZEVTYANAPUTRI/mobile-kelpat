import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileflutterkelompok4/routes.dart';
import 'package:mobileflutterkelompok4/screens/login/loginscreens.dart';
import 'package:mobileflutterkelompok4/theme.dart';

void main() async {
  runApp(MaterialApp(
    title: "Super Ndower",
    theme: theme(),
    initialRoute: loginscreen.routeName,
    routes: routes,
  ));
}