import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/login/loginform.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class logincomponent extends StatefulWidget {
  const logincomponent({super.key});

  @override
  State<logincomponent> createState() => _logincomponentState();
}

class _logincomponentState extends State<logincomponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                SimpleShadow(
                  child: Image.asset(
                    "assets/images/diet.png",
                    height: 200,
                    width: 202,
                  ),
                  opacity: 0.5,
                  color: kSecondaryColor,
                  offset: Offset(5, 5),
                  sigma: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login !!!",
                        style: mTitleStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                signinform()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
