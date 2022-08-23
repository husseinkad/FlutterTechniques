import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreController extends ChangeNotifier {
  int counter = 1;
  int countersWeHave = 13;

  int get count => counter;


  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(counter < countersWeHave){
      counter = (prefs.getInt('counter') ?? 0) + 1;
    }
    prefs.setInt('counter', counter);
    notifyListeners();
  }

  decrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(counter == 1){
      counter = 1;
    }else{
      counter = (prefs.getInt('counter') ?? 0) - 1;
    }
    prefs.setInt('counter', counter);
    notifyListeners();
  }

  removeCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('counter');
    counter = (prefs.getInt('counter') ?? 1);
    prefs.setInt('counter', counter);
    notifyListeners();
  }
}