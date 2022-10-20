import 'package:flutter_geo_alarm/features/geo/domain/entities/geo_alarm_entity.dart';

class GeoAlarmModel extends GeoAlarmEntity {
  const GeoAlarmModel(
      {required super.name,
      required super.radius,
      required super.cordX,
      required super.cordY,
      required super.music});
  factory GeoAlarmModel.fromJson(Map<String, dynamic> json) {
    return GeoAlarmModel(
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
