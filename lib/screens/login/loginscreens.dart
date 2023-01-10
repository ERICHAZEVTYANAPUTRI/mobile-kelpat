import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/login/logincomponent.dart';
import 'package:mobileflutterkelompok4/size_config.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: logincomponent(),
    );
  }
}
