import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/admin/crud/inputmenu/inputmenuform.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class inputmenucomponent extends StatefulWidget {
  @override
  State<inputmenucomponent> createState() => _inputmenucomponentState();
}

class _inputmenucomponentState extends State<inputmenucomponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                    Text(
                      "Input Data Menu !!!",
                      style: mTitleStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              menuform()
            ],
          ),
        ),
      ),
    );
  }
}
