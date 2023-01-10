import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/components/custom_survix_icon.dart';
import 'package:mobileflutterkelompok4/components/default_button_custome_color.dart';
import 'package:mobileflutterkelompok4/screens/Admin/DashaboardAdminscreens.dart';
import 'package:mobileflutterkelompok4/screens/Admin/homeadminscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/DashboardUserscreens.dart';
import 'package:mobileflutterkelompok4/screens/User/homeuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/register/registerscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class signinform extends StatefulWidget {
  const signinform({super.key});

  @override
  State<signinform> createState() => _signinformState();
}

class _signinformState extends State<signinform> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;

  TextEditingController txtEmail = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  Response? response;
  var dio = Dio();

  @override
  void initState() {
    super.initState();
    //prosesRegistrasi();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildemail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildpassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              Text("Tetap Masuk"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Lupa Pasword",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Login",
            press: () {
              if (txtEmail.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Email Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else if (txtPassword.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Password Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else {
                proseslogin(txtEmail.text, txtPassword.text);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, registerscreen.routeName);
            },
            child: Text(
              "Belum Punya Akun ? Daftar Sekarang !",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildemail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Masukkan Email Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }

  TextFormField buildpassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Masukkan Password Anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }

  void proseslogin(email, password) async {
    utilsApps.showDialog(context);

    bool status;
    var message;
    var dataUser;
    try {
      response = await dio
          .post(urllogin, data: {'email': email, 'password': password});
      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'YES !!!',
          desc: 'ANDA BERHASIL LOGIN !!!',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            dataUser = response!.data['data'];
            if (dataUser['role'] == 1) {
              Navigator.pushNamed(context, Homeuserscreen.routeName,
                  arguments: dataUser);
            } else if (dataUser['role'] == 2) {
              Navigator.pushNamed(context, Homeadminscreen.routeName);
            } else {
              print("halaman tidak ditemukan");
            }
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'PRINGATAN !!!',
          desc: 'ANDA GAGAL LOGIN !!! => $message',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            //Navigator.pushNamed(context, loginscreen.routeName);
          },
        ).show();
      }
    } catch (e) {
      utilsApps.hideDialog(context);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'PRINGATAN !!!',
        desc: 'ADA YANG SALAH PADA SERVER !!!',
        btnOkOnPress: () {
          utilsApps.hideDialog(context);
          //Navigator.pushNamed(context, loginscreen.routeName)
        },
      ).show();
    }
  }
}
