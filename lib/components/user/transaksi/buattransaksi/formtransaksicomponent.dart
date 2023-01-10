import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/components/default_button_custome_color.dart';
import 'package:mobileflutterkelompok4/screens/User/DashboardUserscreens.dart';
import 'package:mobileflutterkelompok4/screens/User/homeuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/tempatpesananuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/transaksi/transaksiscreen.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';
import 'package:dio/dio.dart';

class transaksiformusercomponent extends StatefulWidget {
  @override
  State<transaksiformusercomponent> createState() =>
      _transaksiformusercomponentState();
}

class _transaksiformusercomponentState
    extends State<transaksiformusercomponent> {
  var totalBayar = 0.0;
  var jumlahBeli = 0.0;
  var hargaBarang = transaksiscreen.datamenu['harga'];

  Response? response;
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Image.network(
          "$baseUrl/${transaksiscreen.datamenu['gambar']}",
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Menu  :",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${transaksiscreen.datamenu['nama']}",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keterangan   :",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${transaksiscreen.datamenu['keterangan']}",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jenis               :",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${transaksiscreen.datamenu['jenis']}",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harga              :",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${transaksiscreen.datamenu['harga']}",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah Beli",
                style: mTitleStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Padding(
            padding: EdgeInsets.only(left: 10, top: 3),
            child: SpinBox(
              min: 0,
              max: 10,
              value: 0,
              onChanged: (value) {
                setState(() {
                  jumlahBeli = value;
                  totalBayar = jumlahBeli * hargaBarang;
                });
              },
            )),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total : ",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$totalBayar",
                    style: mTitleStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          text: "Beli",
          press: () {
            if (totalBayar <= 0 || jumlahBeli <= 0) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.rightSlide,
                title: 'Peringatan',
                desc:
                    'Minimum Pembelian Adalah 1 !!! Dan Maximum Adalah 10 !!!',
                btnOkOnPress: () {},
              ).show();
            } else {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.rightSlide,
                      title: 'Peringatan',
                      desc:
                          'Yakin ingin melakukan pembelian menu ${transaksiscreen.datamenu['nama']} ?....',
                      btnOkOnPress: () {
                        prosesTransaksi(
                            transaksiscreen.datamenu['_id'],
                            Homeuserscreen.dataUser['_id'],
                            jumlahBeli,
                            hargaBarang,
                            totalBayar);
                      },
                      btnCancelOnPress: () {})
                  .show();
            }
          },
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
      ],
    ));
  }

  void prosesTransaksi(idBarang, idUser, jumlah, harga, total) async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      response = await dio.post(createTransaksi, data: {
        'idBarang': idBarang,
        'idUser': idUser,
        'jumlah': jumlah,
        'harga': harga,
        'total': total,
      });

      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Berhasil Membeli',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            Navigator.pushNamed(context, pesananuserscreen.routeName,
                arguments: pesananuserscreen.dataUser);
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Gagal Transaksi => $message',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          },
        ).show();
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Peringatan',
        desc: 'Terjadi Kesalahan Pada Server',
        btnOkOnPress: () {
          utilsApps.hideDialog(context);
        },
      ).show();
    }
  }
}
