
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';

import 'geo_state.dart';



class CheckAppCubit extends Cubit<GeoAlarmState > {
  // final GetSettingsCase settings;
  // final GetAlarmsCase alarms;

  CheckAppCubit(GeoAlarmState  initialState, 
  //this.authUser, this.signUpUser
  )
      : super(initialState);

  void loagings(){
    
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
