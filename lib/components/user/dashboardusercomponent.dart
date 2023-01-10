import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/screens/User/transaksi/transaksiscreen.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class dashboardusercomponent extends StatefulWidget {
  @override
  State<dashboardusercomponent> createState() => _dashboardusercomponentState();
}

class _dashboardusercomponentState extends State<dashboardusercomponent> {
  Response? response;
  var dio = Dio();
  var datamenu;

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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, transaksiscreen.routeName,
            arguments: data);
      },
      child: Card(
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
                                color: mTitleColor,
                                fontWeight: FontWeight.bold),
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
                                color: mTitleColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: mTitleColor,
              size: 30.0,
            ),
          ),
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
