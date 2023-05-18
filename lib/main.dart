import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/": (context) => loading(),
      "/home": (context) => Home(),
      "/location": (context) => choose_locations(),

    },




  ));
}
