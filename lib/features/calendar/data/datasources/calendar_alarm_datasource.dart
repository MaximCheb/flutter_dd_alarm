import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_geo_alarm/features/classic/data/models/alarm_model.dart';
import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';
import 'package:path_provider/path_provider.dart';

abstract class CalendarAlarmDatasource{
  Future<List<AlarmModel>>getCalendarAlarms();
  Future<void> setCalendarAlarm(List<AlarmModel> alarms);
}
class CalendarAlarmLocalDatasourceImpl implements CalendarAlarmDatasource{
  @override
  Future<List<AlarmModel>> getCalendarAlarms() async {
    String data = await rootBundle.loadString("assets/data/calendar.json");
    final jsonResult = json.decode(data);
    var parsedJson = <dynamic>[];
    return Future.value(parsedJson.map((person) => AlarmModel
        .fromJson(json.decode(person))).toList());
  }

  @override
  Future<void> setCalendarAlarm(List<AlarmModel> alarms) async{
    var path = "$_appPath/assets/data/calendar.json";
    File data = File(path);
    List<String> dataAlarms = alarms.map((alarm)=>json.encode(alarm.toJson())).toList();
    data.writeAsString(jsonEncode(dataAlarms));
  }

  Future<String> get _appPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

}