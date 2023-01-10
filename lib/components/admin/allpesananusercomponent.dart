import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobileflutterkelompok4/Api/configApi.dart';
import 'package:mobileflutterkelompok4/screens/User/homeuserscreen.dart';
import 'package:mobileflutterkelompok4/screens/User/tempatpesananuserscreen.dart';
import 'package:mobileflutterkelompok4/size_config.dart';
import 'package:mobileflutterkelompok4/utils/constants.dart';

class allpesananuserComponents extends StatefulWidget {
  @override
  State<allpesananuserComponents> createState() => _allpesananuserComponents();
}

class _allpesananuserComponents extends State<allpesananuserComponents> {
  Response? response;
  var dio = Dio();
  var dataTransaksi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataTransaksi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dataTransaksi == null ? 0 : dataTransaksi.length,
                itemBuilder: (BuildContext context, int index) {
                  // return cardTransaksi(dataGitar[index]);
                  return cardTransaksi(dataTransaksi[index]);
                },
              ),
            ),
          ],
        )),
      ),
    ));
  }

  Widget cardTransaksi(data) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, UploadBuktiPembayaranScreens.routeName,
        //     arguments: data);
      },
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
                child:
                    Image.network('$baseUrl/${data['dataBarang']['gambar']}'),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data['dataBarang']['nama']}",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "IdPembeli     :",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${data['idUser']}",
                    style: TextStyle(
                        color: kColorRedSlow, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Tanggal Beli :",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${data['tanggal']}",
                    style: TextStyle(
                        color: kColorRedSlow, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Harga            :",
                        style: TextStyle(
                            color: mTitleColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rp. ${data['harga']}",
                        style: TextStyle(
                            color: kColorRedSlow, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Jumlah Beli  :",
                        style: TextStyle(
                            color: mTitleColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${data['jumlah']}",
                        style: TextStyle(
                            color: kColorRedSlow, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "______________________x",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        "Total              :",
                        style: TextStyle(
                            color: mTitleColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rp. ${data['total']}",
                        style: TextStyle(
                            color: kColorRedSlow, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Transaksi      :",
                        style: TextStyle(
                            color: mTitleColor, fontWeight: FontWeight.bold),
                      ),
                      data['buktiPembayaran'] == null
                          ? Text(
                              "Pending",
                              style: TextStyle(
                                  color: kColorYellow,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              "Berhasil",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                    ],
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
      ),
    );
  }

  void getDataTransaksi() async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      response = await dio.get(getalldata);
      status = response!.data['sukses'];
      message = response!.data['message'];
      if (status) {
        setState(() {
          dataTransaksi = response!.data['data'];
          print(dataTransaksi);
        });
      } else {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Peringatan',
            desc: '$message',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
            }).show();
      }
    } catch (e) {
      print(e);
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: 'Terjadi kesalahan pada server kami',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          }).show();
    }
  }
}
