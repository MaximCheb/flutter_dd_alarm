import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';

class AlarmModel extends AlarmEntity {
  AlarmModel(
      {required super.name,
      required super.time,
      required super.repeat,
      required super.music,
      required super.days});

  factory AlarmModel.fromJson(Map<String, dynamic> json) {
    return AlarmModel(
        name: json['name'],
        time: json['time'],
        repeat: json['repeat'],
        music: json['music'],
        days: json['days'].cast<String>());
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "time": time,
      "repeat": repeat,
      "music": music,
      "days": days.join(',\n')
    };
  }
}
