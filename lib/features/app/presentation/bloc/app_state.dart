
import 'package:equatable/equatable.dart';
import 'package:flutter_geo_alarm/features/app/data/models/settings_model.dart';
import 'package:flutter_geo_alarm/features/app/domain/entities/settings_entity.dart';


abstract class AppState extends Equatable{
  const  AppState();
  @override
  List<Object?> get props => [];
}
class EmptySettingsState extends AppState{
  @override
  List<Object?> get props => [];
}
class LoadingSettingsState extends AppState {

  LoadingSettingsState();
    
  @override
  List<Object?> get props => [];
}

class LoadedSettingsState extends AppState {
  final SettingsModel settings;

  const LoadedSettingsState(this.settings);

  @override
  List<Object?> get props => [settings];
}

class ErrorSettingsState extends AppState {
  final String message;
  const ErrorSettingsState({required this.message});
  
  @override
  List<Object?> get props => [message];
}

