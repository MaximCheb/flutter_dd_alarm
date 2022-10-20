
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:flutter_geo_alarm/core/usecase/usecase.dart';
import 'package:flutter_geo_alarm/features/app/data/models/settings_model.dart';

import '../../domain/usecases/settings_usecase.dart';
import 'app_state.dart';



class AppCubit extends Cubit<AppState> {
  final GetSettingsCase settingsCase;
  // final GetAlarmsCase alarms;

  AppCubit({required this.settingsCase}
  )
      : super(EmptySettingsState());

  Future<void> checkSettings() async {
    SettingsModel settings;
    if ( state is LoadedSettingsState) {
      return;
    }
    if ( state is EmptySettingsState) {
      emit(LoadingSettingsState());
      var failOrSettings = await settingsCase.call(VoidParam());
      failOrSettings.fold(
              (error) => emit (ErrorSettingsState(message: _mapFailureToMessage(error))),
              (result) => emit(LoadedSettingsState(result))
      );  
      return;
    }  

  }
  
  _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case FirebaseFailure:
        return 'Server failure';
      case FileFailure:
        return 'Cache failure';
      default:
        return "Unexpected failure";
    }
  }
}
