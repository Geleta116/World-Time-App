import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:world_time_app/SERVICES/world_time.dart';

class choose_locations extends StatefulWidget {
  const choose_locations({super.key});

  @override
  State<choose_locations> createState() => _choose_locationsState();
}

class _choose_locationsState extends State<choose_locations> {
  List<WorldTime> locations = [
    WorldTime('uk.png', 'Europe/London', 'London'),
    WorldTime('greece.png', 'Europe/Berlin', 'Athens'),
    WorldTime('egypt.png', 'Africa/Cairo', 'Cairo'),
    WorldTime('kenya.png', 'Africa/Nairobi', 'Nairobi'),
    WorldTime('usa.png', 'America/Chicago', 'Chicago'),
    WorldTime('usa.png', 'America/New_York', 'New York'),
    WorldTime('south_korea.png', 'Asia/Seoul', 'Seoul'),
    WorldTime(
      'indonesia.png',
      'Asia/Jakarta',
      'Jakarta',
    ),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("choose locations"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("images/${locations[index].flag}"),
                  ),
                ),
              );
            }));
  }
}
