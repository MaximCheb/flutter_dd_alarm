import 'package:dartz/dartz.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';

import '../entities/alarm_entity.dart';

abstract class AlarmRepository{
  Future<Either<Failure,List<AlarmEntity>>> getAllAlarms();
  Future<Either<Failure,bool>> writeAlarmsToFile(List<AlarmEntity> alarms);
}