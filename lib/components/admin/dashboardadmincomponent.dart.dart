import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/screens/Admin/DashaboardAdminscreens.dart';
import 'package:mobileflutterkelompok4/screens/Admin/crud/editmenuscreen.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class dashboardadmincomponent extends StatefulWidget {
  @override
  State<dashboardadmincomponent> createState() =>
      _dashboardadmincomponentState();
}

class _dashboardadmincomponentState extends State<dashboardadmincomponent> {
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
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, editmenuscreen.routeName,
                      arguments: data);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: kColorYellow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(
                          color: mTitleColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'PRINGATAN !!!',
                      desc: 'Yakin Ingin Menghapus ${data['nama']} ???...',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        utilsApps.hideDialog(context);
                        hapusdatamenu('${data['_id']}');
                      }).show();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: kColorRedSlow,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Hapus",
                      style: TextStyle(
                          color: mTitleColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: mTitleColor,
            size: 30.0,
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

  void hapusdatamenu(id) async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      response = await dio.delete('$hapusmenu/$id');
      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'PRINGATAN !!!',
            desc: '$message',
            btnOkOnPress: () {
              //Navigator.pushAndRemoveUntil(
              //context, dashboardadminscreen.routeName, (route) => false);
              Navigator.pushNamed(context, dashboardadminscreen.routeName);
            }).show();
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
