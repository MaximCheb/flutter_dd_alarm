
import 'package:equatable/equatable.dart';
import 'package:flutter_geo_alarm/features/app/data/models/settings_model.dart';
import 'package:flutter_geo_alarm/features/app/domain/entities/settings_entity.dart';
import 'package:flutter_geo_alarm/features/classic/domain/entities/alarm_entity.dart';

import '../../domain/entities/calendar_setting_entity.dart';


abstract class CalendarState extends Equatable{
  const  CalendarState();
  @override
  List<Object?> get props => [];
}
class AlarmsEmptyState extends CalendarState{
  @override
  List<Object?> get props => [];
}

class CheckSharedGeoAlarmState extends CalendarState{
  final List<CalendarAlarmEntity> alarms;
  const CheckSharedGeoAlarmState(this.alarms);
  @override
  List<Object?> get props => [alarms];
}
class LoadingAlarmsState extends CalendarState {
  final List<CalendarAlarmEntity> alarms;
  final bool isEmpty;

  const LoadingAlarmsState ( this.alarms, {this.isEmpty = false});
    
  @override
  List<Object?> get props => [alarms];
}

class LoadedAlarmsState extends CalendarState {
  final List<CalendarAlarmEntity>  alarms;

  const LoadedAlarmsState(this.alarms);

  @override
  List<Object?> get props => [alarms];
}
class WriteCalendarAlarmsState extends CalendarState {
  final List<CalendarAlarmEntity>  alarms;

  const WriteCalendarAlarmsState(this.alarms);

  @override
  List<Object?> get props => [alarms];
}

class ErrorState extends CalendarState {
  final String message;
  const ErrorState({required this.message});
  
  @override
  List<Object?> get props => [message];
}

