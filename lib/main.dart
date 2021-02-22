import 'package:flutter/material.dart';
import 'Pages/Home.dart';
import 'Pages/Loading.dart';
import 'Pages/Location.dart';


void main() {
  runApp(MaterialApp(
    initialRoute : '/',
    routes : {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/Location' : (context) => Location()
    }
  ));
}