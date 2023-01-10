import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_touch_spin/flutter_touch_spin.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/screens/User/transaksi/transaksiscreen.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:number_selection/number_selection.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';
import 'package:counter_button/counter_button.dart';

class reservasiusercomponent extends StatefulWidget {
  static var datamenu;

  @override
  State<reservasiusercomponent> createState() => _reservasiusercomponentState();
}

class _reservasiusercomponentState extends State<reservasiusercomponent> {
  Response? response;
  var dio = Dio();
  var datamenu;

  var jumlahBeli = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatamenu();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(20)),
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: datamenu == null ? 0 : datamenu.length,
                      itemBuilder: (BuildContext context, int index) {
                        return carddatamenu(datamenu[index]);
                      },
                    ),
                  ),
                ])))));
  }

  Widget carddatamenu(data) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 253, 253, 253)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: Image.network('$baseUrl/${data['gambar']}'),
            //'http://localhost:5001/2022-12-24T09-05-51.172Z.jpg'),
          ),
          title: Text(
            '${data['nama']}',
            //"Ayam Goreng",
            style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Jenis:",
                          style: TextStyle(
                              color: kColorRedSlow,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${data['jenis']}',
                          style: TextStyle(
                              color: mTitleColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Rp.",
                          style: TextStyle(
                              color: kColorRedSlow,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${data['harga']}',
                          style: TextStyle(
                              color: mTitleColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: TouchSpin(
                  value: 0,
                  min: 0,
                  max: 10,
                  step: 1,
                  textStyle: const TextStyle(fontSize: 18),
                  iconSize: 19.0,
                  addIcon: const Icon(Icons.add_circle),
                  subtractIcon: const Icon(Icons.remove_circle),
                  iconActiveColor: Color.fromARGB(255, 172, 216, 252),
                  iconDisabledColor: Colors.grey,
                  iconPadding: const EdgeInsets.all(6),
                  onChanged: (nama) {
                    debugPrint('${data['nama']}');
                  },
                  enabled: true,
                ),
              ),
            ],
          ),
          // trailing: Icon(
          //   Icons.remove_circle,
          //   color: mTitleColor,
          //   size: 20.0,
          // ),
        ),
      ),
    );
  }

  void getdatamenu() async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      response = await dio.get(getallmenu);
      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        setState(() {
          datamenu = response!.data['data'];
        });
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'PRINGATAN !!!',
            desc: '$message',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              //Navigator.pushNamed(context, loginscreen.routeName)
            }).show();
      }
    } catch (e) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'PRINGATAN !!!',
          desc: 'ADA YANG SALAH PADA SERVER !!!',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            //Navigator.pushNamed(context, loginscreen.routeName)
          }).show();
    }
  }
}
