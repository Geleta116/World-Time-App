import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/SERVICES/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

// ignore: camel_case_types
class _loadingState extends State<loading> {
  String time = "Loading";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      'germany.png',
      "Europe/Berlin",
      'Berlin ',
    );

    await instance.getTime();
    
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 39, 83),
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
