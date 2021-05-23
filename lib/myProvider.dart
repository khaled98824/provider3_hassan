import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier{
  int _count=0;
  int _num =1;


  int get count =>_count;
  int get num =>_num;

  void increment() {
  _count++;
  _num++;
  notifyListeners();
}}