import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/register/registercomponent.dart';
import 'package:mobileflutterkelompok4/size_config.dart';

class registerscreen extends StatelessWidget {
  const registerscreen({super.key});

  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: registercomponent(),
    );
  }
}
