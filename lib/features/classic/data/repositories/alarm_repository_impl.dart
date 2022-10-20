import 'dart:io';

import 'package:flutter_geo_alarm/features/classic/data/datasources/alarm_local_datasource.dart';
import 'package:flutter_geo_alarm/features/classic/data/models/alarm_model.dart';
import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_geo_alarm/features/classic/domain/repositories/alarm_repository.dart';

class AlarmRepositoryImpl extends AlarmRepository {
  final AlarmDatasource alarmDatasource;

  AlarmRepositoryImpl({ required this.alarmDatasource});

  @override
  Future<Either<Failure, List<AlarmEntity>>> getAllAlarms() async {
    try {
        List<AlarmEntity> alarms = await alarmDatasource.getAlarmsFromFile();
        return Right(alarms);
      } on FileSystemException {
        return  Left(FileFailure());
      }
  }
  
  @override
  Future<Either<Failure, bool>> writeAlarmsToFile(List<AlarmEntity> alarms) async {
    try {
        await alarmDatasource.readAlarmsToFile(alarms as List<AlarmModel>);
        return Right(true);
      } on FileSystemException {
        return  Left(FileFailure());
      }
  }
  
}