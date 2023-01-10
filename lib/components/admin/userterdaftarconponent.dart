import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/screens/Admin/datauserterdaftar.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class datausercomponent extends StatefulWidget {
  @override
  State<datausercomponent> createState() => _datausercomponentState();
}

class _datausercomponentState extends State<datausercomponent> {
  Response? response;
  var dio = Dio();
  var datauser;

  @override
  void initState() {
    super.initState();
    getdatauser();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: datauser == null ? 0 : datauser.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return carduser(datauser[index]);
                      return carduser(datauser[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget carduser(data) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: Container(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                child: Image.network("https://freesvg.org/img/1529053671.png"),
              ),
              title: Text(
                "${data['_id']}",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data['username']}",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${data['email']}",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${data['alamat']}",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${data['nohp']}",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'PRINGATAN !!!',
                      desc: 'Yakin Ingin Menghapus ${data['username']} ???...',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        utilsApps.hideDialog(context);
                        hapusdatauser('${data['_id']}');
                      }).show();
                },
                child: Icon(
                  Icons.delete_rounded,
                  color: kColorRedSlow,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getdatauser() async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      response = await dio.get(getalluser);
      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        setState(() {
          datauser = response!.data['data'];
          print(datauser);
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

  void hapusdatauser(id) async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      response = await dio.delete('$hapususer/$id');
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
              Navigator.pushNamed(context, userterdaftarscreen.routeName);
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
      print(e);
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
