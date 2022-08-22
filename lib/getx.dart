// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class StoreController extends GetxController {
//
//   var counter = 0;
//
//   loadCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//       counter = prefs.getInt('counter') ?? 0;
//       update();
//   }
//
//   incrementCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//       counter = (prefs.getInt('counter') ?? 0) + 1;
//       prefs.setInt('counter', counter);
//       update();
//   }
// }