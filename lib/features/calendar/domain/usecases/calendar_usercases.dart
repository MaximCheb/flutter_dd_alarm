import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:flutter_geo_alarm/core/usecase/file_usercase.dart';
import 'package:flutter_geo_alarm/features/calendar/data/models/calendar_alarm_model.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/calendar_setting_entity.dart';

class GetAllCalendarAlarms extends UseCase<List<CalendarAlarmEntity>,VoidParam>{
  final Future<File> alarmsFile = FileUsercase.getUserFolder("calendars.json");
  @override
  Future<Either<Failure, List<CalendarAlarmEntity>>> call(VoidParam? params) async {
    try {
      List<CalendarAlarmModel> alarms = await getAlarmsFromFile();
      return Right(alarms);
    } on FileSystemException {
      return  Left(FileFailure());
    }
  }
  Future<List<CalendarAlarmModel>> getAlarmsFromFile() async{
    var jsonAlarms = await alarmsFile.then((value) => value.readAsString());
    var list =  (json.decode(jsonAlarms)as List).map((element) => CalendarAlarmModel.fromJson(element)).toList();
    return list;
  }
}

class WriteAllCalendarAlarms extends UseCase<bool,CalendarAlarmsParam>{
  final Future<File> alarmsFile = FileUsercase.getUserFolder("calendars.json");
  @override
  Future<Either<Failure, bool>> call(CalendarAlarmsParam params) async {
    try {
      await readAlarmsToFile(params.alarms as List<CalendarAlarmModel>);
      return const Right(true);
    } on FileSystemException {
      return  Left(FileFailure());
    }
  }
  Future<void> readAlarmsToFile(List<CalendarAlarmModel> alarms) {
    var jsonResult = json.encode(alarms);
    alarmsFile.then((value) => value.writeAsString(jsonResult));
    return Future.value();
  }
}

class CalendarAlarmsParam extends Equatable {
  final List<CalendarAlarmEntity> alarms;

  const CalendarAlarmsParam({required this.alarms});

  @override
  List<Object?> get props => [alarms];
}