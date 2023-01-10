// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:mobileflutterkelompok4/components/user/transaksi/buattransaksi/transaksiusercomponent.dart';
// import 'package:mobileflutterkelompok4/screens/User/DashboardUserscreens.dart';
// import 'package:mobileflutterkelompok4/size_config.dart';
// import 'package:mobileflutterkelompok4/utils/constants.dart';

// class datatransaksiscreen extends StatelessWidget {
//   static var routeName = 'hasiltransaksi_user';

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, dashboarduserscreen.routeName);
//           },
//           child: const Icon(
//             Icons.arrow_back_sharp,
//             color: mTitleColor,
//           ),
//         ),
//         title: Text(
//           "Pemesanan",
//           style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: transaksiusercomponent(),
//     );
//   }
// }
