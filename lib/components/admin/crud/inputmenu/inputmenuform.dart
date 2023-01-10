import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/components/custom_survix_icon.dart';
import 'package:mobileflutterkelompok4/components/default_button_custome_color.dart';
import 'package:mobileflutterkelompok4/screens/Admin/DashaboardAdminscreens.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class menuform extends StatefulWidget {
  @override
  State<menuform> createState() => _menuformState();
}

class _menuformState extends State<menuform> {
  TextEditingController txtnamamenu = TextEditingController(),
      txtjenismenu = TextEditingController(),
      txthargamenu = TextEditingController(),
      txtketeranganmenu = TextEditingController();

  FocusNode focusNode = new FocusNode();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  // File? image;
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
          buildnamamenu(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildjenismenu(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildhargamenu(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildketeranganmenu(),
          SizedBox(height: getProportionateScreenHeight(30)),
          _pickedImage == null
              ? Container()
              : kIsWeb
                  ? Image.memory(webImage, fit: BoxFit.cover)
                  : Image.file(_pickedImage!, fit: BoxFit.cover),
          SizedBox(height: getProportionateScreenHeight(30)),
          // image == null
          //     ? Container()
          //     : Image.file(
          //         image!,
          //         // width: 250,
          //         // height: 250,
          //         fit: BoxFit.cover,
          //       ),
          DefaultButtonCustomeColor(
            color: kColorGreen,
            text: "Pilih Gambar Menu",
            press: () {
              _pickImage();
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Submit",
            press: () {
              if (txtnamamenu.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Nama Menu Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else if (txtjenismenu.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Jenis Menu Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else if (txthargamenu.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Harga Menu Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else if (txtketeranganmenu.text == '') {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: 'PRINGATAN !!!',
                    desc: 'Keterangan Menu Tidak Boleh Kosong',
                    btnOkOnPress: () {
                      utilsApps.hideDialog(context);
                      //Navigator.pushNamed(context, loginscreen.routeName);
                    }).show();
              } else {
                inputdatamenu(
                    txtnamamenu.text,
                    txtjenismenu.text,
                    txthargamenu.text,
                    txtketeranganmenu.text,
                    _pickedImage?.path);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextFormField buildnamamenu() {
    return TextFormField(
      controller: txtnamamenu,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nama Menu',
          hintText: 'Masukkan Nama Menu',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.near_me_outlined)),
    );
  }

  TextFormField buildjenismenu() {
    return TextFormField(
      controller: txtjenismenu,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Jenis Menu',
          hintText: 'Masukkan Jenis Menu',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.get_app_rounded)),
    );
  }

  TextFormField buildhargamenu() {
    return TextFormField(
      controller: txthargamenu,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Harga',
        hintText: 'Masukkan Harga Menu',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.monetization_on_outlined),
      ),
    );
  }

  TextFormField buildketeranganmenu() {
    return TextFormField(
      controller: txtketeranganmenu,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Keterangan Menu',
        hintText: 'Masukkan Keterangan Menu',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.note_alt_outlined),
      ),
    );
  }

  // Future pilihGambar() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (!kIsWeb) return;
  //     final imageTemp = File(image!.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print("Gagal mengambil foto : $e");
  //   }
  // }
  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("no gambar");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print("tidak ada gambar terpilih");
      }
    } else {
      print("ada yang salah");
    }
  }

  void inputdatamenu(nama, jenis, harga, keterangan, gambar) async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      var formData = FormData.fromMap({
        'nama': nama,
        'jenis': jenis,
        'harga': harga,
        'keterangan': keterangan,
        'gambar': await MultipartFile.fromBytes(gambar)
      });
      response = await dio.post(inputmenu, data: formData);
      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'YES !!!',
            desc: '$message',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
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
              //Navigator.pushNamed(context, loginscreen.routeName);
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
