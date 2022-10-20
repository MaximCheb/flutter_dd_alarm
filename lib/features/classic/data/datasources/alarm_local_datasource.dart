import 'dart:convert';
import 'dart:io';

import 'package:flutter_geo_alarm/core/usecase/file_usercase.dart';

import '../models/alarm_model.dart';

abstract class AlarmDatasource {
  Future<List<AlarmModel>> getAlarmsFromFile();
  Future<void>readAlarmsToFile(List<AlarmModel> alarms);
}

class AlarmDatasourceImpl extends AlarmDatasource{
  final Future<File> alarmsFile = FileUsercase.getUserFolder("alarms.json");

  @override
  Future<List<AlarmModel>> getAlarmsFromFile() async{
    var jsonAlarms = await alarmsFile.then((value) => value.readAsString());
    var list =  (json.decode(jsonAlarms)as List).map((element) => AlarmModel.fromJson(element)).toList();
    return list;
  }
  
  @override
  Future<void> readAlarmsToFile(List<AlarmModel> alarms) {
    var jsonResult = json.encode(alarms);
    alarmsFile.then((value) => value.writeAsString(jsonResult));
    return Future.value();
  }

}