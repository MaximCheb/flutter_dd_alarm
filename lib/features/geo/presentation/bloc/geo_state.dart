
import 'package:equatable/equatable.dart';
import 'package:flutter_geo_alarm/features/app/data/models/settings_model.dart';
import 'package:flutter_geo_alarm/features/app/domain/entities/settings_entity.dart';
import 'package:flutter_geo_alarm/features/geo/domain/entities/geo_alarm_entity.dart';


abstract class GeoAlarmState extends Equatable{
  const  GeoAlarmState();
  @override
  List<Object?> get props => [];
}
class EmptySettingsState extends GeoAlarmState{
  @override
  List<Object?> get props => [];
}

class CheckSharedGeoAlarmState extends GeoAlarmState{

  const CheckSharedGeoAlarmState();
  @override
  List<Object?> get props => [];
}
class LoadingState extends GeoAlarmState {
  final List<GeoAlarmEntity> settings;
  final bool isEmptyUserData;

  LoadingState ( this.settings, {this.isEmptyUserData = false});
    
  @override
  List<Object?> get props => [settings];
}

class LoadedSettingsState extends GeoAlarmState {
  final SettingsModel user;

  const LoadedSettingsState(this.user);

  @override
  List<Object?> get props => [user];
}

class ErrorState extends GeoAlarmState  {
  final String message;
  const ErrorState({required this.message});
  
  @override
  List<Object?> get props => [message];
}

