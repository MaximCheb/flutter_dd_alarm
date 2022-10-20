
import 'package:equatable/equatable.dart';
import 'package:flutter_geo_alarm/features/app/data/models/settings_model.dart';
import 'package:flutter_geo_alarm/features/app/domain/entities/settings_entity.dart';
import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';


abstract class AlarmState extends Equatable{
  const  AlarmState();
  @override
  List<Object?> get props => [];
}
class AlarmsEmptyState extends AlarmState{
  @override
  List<Object?> get props => [];
}

class CheckSharedGeoAlarmState extends AlarmState{
  final List<AlarmEntity> alarms;
  const CheckSharedGeoAlarmState(this.alarms);
  @override
  List<Object?> get props => [alarms];
}
class LoadingAlarmsState extends AlarmState {
  final List<AlarmEntity> alarms;
  final bool isEmpty;

  const LoadingAlarmsState ( this.alarms, {this.isEmpty = false});
    
  @override
  List<Object?> get props => [alarms];
}

class LoadedAlarmsState extends AlarmState {
  final List<AlarmEntity>  alarms;

  const LoadedAlarmsState(this.alarms);

  @override
  List<Object?> get props => [alarms];
}
class WriteAlarmsState extends AlarmState {
  final List<AlarmEntity>  alarms;

  const WriteAlarmsState(this.alarms);

  @override
  List<Object?> get props => [alarms];
}

class ErrorState extends AlarmState {
  final String message;
  const ErrorState({required this.message});
  
  @override
  List<Object?> get props => [message];
}

