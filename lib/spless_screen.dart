// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:wallpaper/main.dart';
//
// class screen extends StatefulWidget {
//   @override
//   State<screen> createState() => _screenState();
// }
//
// class _screenState extends State<screen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     permition();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: SizedBox(
//               height: double.infinity,
//               child: Lottie.asset(
//                   fit: BoxFit.fill,
//                   "image/54146-portfolio-app-icons-loop.json"))),
//     );
//   }
//
//   permition() async {
//     var status = await Permission.storage.status;
//     if (status.isDenied) {
//       Map<Permission, PermissionStatus> statuses = await [
//         Permission.storage,
//       ].request();
//     }
//     await Future.delayed(Duration(seconds: 3));
//     Navigator.pushReplacement(context, MaterialPageRoute(
//       builder: (context) {
//         return wallpaper();
//       },
//     ));
//   }
// }
