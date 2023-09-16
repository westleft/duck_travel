import 'package:duck_travel/screens/detail_screen.dart';
import 'package:duck_travel/screens/home_screen.dart';
import 'package:duck_travel/screens/result_screen.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (BuildContext context) => HomeScreen(),
  '/result': (BuildContext context) => ResultScreen(),
  '/detail': (BuildContext context) => DetailScreen(),
};
