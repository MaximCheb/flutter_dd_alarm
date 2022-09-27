import 'package:dartz/dartz.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:flutter_geo_alarm/features/calendar/data/models/calendar_alarm_model.dart';

import '../entities/calendar_setting_entity.dart';

abstract class CalendarAlarmRepository{
  Future<Either<Failure,List<CalendarAlarmEntity>>>getAllAlarms();
  Future<Either<Failure,bool>>addAlarm();
}