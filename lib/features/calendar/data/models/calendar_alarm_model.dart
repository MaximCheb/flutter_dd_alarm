import 'package:flutter_geo_alarm/features/calendar/domain/entities/calendar_setting_entity.dart';

class CalendarAlarmModel extends CalendarAlarmEntity{
  const CalendarAlarmModel({required super.name, required super.period, required super.repeat, required super.music, required super.interval, required super.times});

  factory CalendarAlarmModel.fromJson(Map<String, dynamic> json){
  return CalendarAlarmModel(
    name: json['name'],
    period: json['period'],
    repeat: json['repeat'],
    music: json['music'],
    interval: json['interval'],
    times: json['times']
  );
  }


}