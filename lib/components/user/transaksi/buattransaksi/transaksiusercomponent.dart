import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileflutterkelompok4/components/user/transaksi/buattransaksi/formtransaksicomponent.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class transaksiusercomponent extends StatefulWidget {
  const transaksiusercomponent({super.key});

  @override
  State<transaksiusercomponent> createState() => _transaksiusercomponentState();
}

class _transaksiusercomponentState extends State<transaksiusercomponent> {
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
                Padding(
                  padding: EdgeInsets.only(left: 110),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pesan Sekarang !!!",
                        style: mTitleStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                transaksiformusercomponent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
