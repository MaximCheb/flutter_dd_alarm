import 'package:equatable/equatable.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_geo_alarm/core/usecase/usecase.dart';
import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';
import 'package:flutter_geo_alarm/features/classic/domain/repositories/alarm_repository.dart';

class GetAllAlarms extends UseCase<List<AlarmEntity>,VoidParam>{

  final AlarmRepository repository;

  GetAllAlarms({ required this.repository});

  @override
  Future<Either<Failure, List<AlarmEntity>>> call(VoidParam? params) async {
    return await repository.getAllAlarms();
  }
  
}

class WriteAllAlarms extends UseCase<bool,AlarmsParam>{

  final AlarmRepository repository;

  WriteAllAlarms({ required this.repository});

  @override
  Future<Either<Failure, bool>> call(AlarmsParam params) async {
    return await repository.writeAlarmsToFile(params.alarms);
  }
  
}

class AlarmsParam extends Equatable {
  final List<AlarmEntity> alarms;

  const AlarmsParam({required this.alarms});

  @override
  List<Object?> get props => [alarms];

  
}