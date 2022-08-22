import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreController extends ChangeNotifier {
  int counter = 0;

  int get count => counter;


  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt('counter', counter);
    notifyListeners();
  }
}