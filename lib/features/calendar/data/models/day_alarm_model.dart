import 'package:flutter_geo_alarm/features/calendar/domain/entities/calendar_setting_entity.dart';

class DayAlarmModel extends DayAlarmEntity {
  DayAlarmModel({required super.name, required super.time});

  factory DayAlarmModel.fromJson(Map<String, dynamic> json) {
    return DayAlarmModel(name: json['name'], time: json['time']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'time':time,
    };
  }
}
