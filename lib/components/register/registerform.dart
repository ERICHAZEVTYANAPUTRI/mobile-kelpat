import 'package:dio/dio.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/components/custom_survix_icon.dart';
import 'package:mobileflutterkelompok4/components/default_button_custome_color.dart';
import 'package:mobileflutterkelompok4/screens/login/loginscreens.dart';
import 'package:mobileflutterkelompok4/screens/register/registerscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class registerform extends StatefulWidget {
  const registerform({super.key});

  @override
  State<registerform> createState() => _registerformState();
}

class _registerformState extends State<registerform> {
  final _formKey = GlobalKey<FormState>();

  String? username;
  String? email;
  String? password;
  String? nohp;
  String? alamat;

  bool? remember = false;

  TextEditingController txtUserName = TextEditingController(),
      txtEmail = TextEditingController(),
      txtPassword = TextEditingController(),
      txtNohp = TextEditingController(),
      txtAlamat = TextEditingController();

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
      key: _formKey,
      child: Column(
        children: [
          buildusername(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildemail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildpassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildnohp(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildalamat(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Registrasi",
            press: () {
              print(prosesRegistrasi);
              if (txtUserName.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Nama Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else if (txtEmail.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Alamat Tidak Boleh Kosong',
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
              } else if (txtNohp.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Alamat Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else if (txtAlamat.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Nomor HP Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else {
                prosesRegistrasi(txtUserName.text, txtPassword.text,
                    txtEmail.text, txtNohp.text, txtAlamat.text);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, loginscreen.routeName);
            },
            child: Text(
              "Sudah Punya Akun ? Kembali KeLogin !",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildusername() {
    return TextFormField(
      controller: txtUserName,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Masukkan Username',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nama Tidak Boleh Kosong";
        }
        return null;
      },
    );
  }

  TextFormField buildemail() {
    return TextFormField(
      controller: txtEmail,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Masukkan Email',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Alamat Tidak Boleh Kosong";
        }
        return null;
      },
    );
  }

  TextFormField buildpassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Masukkan Password',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password Tidak Boleh Kosong";
        }
        return null;
      },
    );
  }

  TextFormField buildnohp() {
    return TextFormField(
      controller: txtNohp,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nomor HP',
          hintText: 'Masukkan Nomor HP',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nomor HP Tidak Boleh Kosong";
        }
        return null;
      },
    );
  }

  TextFormField buildalamat() {
    return TextFormField(
      controller: txtAlamat,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Alamat',
          hintText: 'Masukkan Alamat',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Home.svg",
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Nomor HP Tidak Boleh Kosong";
        }
        return null;
      },
    );
  }

  void prosesRegistrasi(userName, password, email, nohp, alamat) async {
    utilsApps.showDialog(context);

    bool status;
    var message;
    try {
      response = await dio.post(urlRegister, data: {
        'username': userName,
        'password': password,
        'email': email,
        'nohp': nohp,
        'alamat': alamat,
      });
      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'YES !!!',
          desc: 'ANDA BERHASIL REGISTRASI !!!',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            Navigator.pushNamed(context, loginscreen.routeName);
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'PRINGATAN !!!',
          desc: 'ANDA GAGAL REGISTRASI !!! => $message',
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
          //Navigator.pushNamed(context, loginscreen.routeName)
        },
      ).show();
    }
  }
}
