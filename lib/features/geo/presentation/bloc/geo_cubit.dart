
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

  void signinUser(){
    if ( state is GeoAlarmState ) {
      return;
    }
    if ( state is EmptySettingsState) {
      emit(CheckSharedGeoAlarmState ());
      return;
    }
    final currentState = state;
    if ( state is LoadedSettingsState) {
      return;
    }

  }
  void signupUser(){

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
