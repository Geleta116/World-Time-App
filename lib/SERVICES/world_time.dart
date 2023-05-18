import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime {
  late String time;
  late String url;
  late String location;
  late String flag;
  late bool isDayTime;

  WorldTime(String flag, String url, String location) {
    this.flag = flag;
    this.location = location;
    this.url = url;
  }
  // { this.location, this.flag, this.url });

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      Map data = jsonDecode(response.body);
      String datetime = data["datetime"];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (error) {
      print("ERROR: $error");
      time = "Something went wrong";
    }
  }
}
