// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_geo_alarm/features/calendar/domain/entities/calendar_setting_entity.dart';

class CalendarAlarmPage extends StatelessWidget {
  late CalendarAlarmEntity entity;
  CalendarAlarmPage({Key? key, CalendarAlarmEntity? entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add calendar alarm")),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}