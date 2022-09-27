import 'package:flutter_geo_alarm/features/geo/domain/entities/geo_alarm_entity.dart';

class MapAlarmModel extends MapAlarmEntity {
  const MapAlarmModel(
      {required super.name,
      required super.radius,
      required super.cordX,
      required super.cordY,
      required super.music});
  factory MapAlarmModel.fromJson(Map<String, dynamic> json) {
    return MapAlarmModel(
        name: json["name"],
        radius: json["radius"],
        cordX: json["cordX"],
        cordY: json["cordY"],
        music: json["music"]);
  }

  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'radius':radius,
      'cordX':cordX,
      'cordY':cordY,
      'music':music
    };
  }
}
