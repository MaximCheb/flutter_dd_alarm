
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:flutter_geo_alarm/features/classic/domain/usecases/alarms_usercases.dart';

import '../../domain/entities/alarm_entity.dart';
import 'alarm_state.dart';



class AlarmCubit extends Cubit<AlarmState> {
  final GetAllAlarms getAlarms;
  final WriteAllAlarms writeAlarms;

  AlarmCubit( this.getAlarms, this.writeAlarms,
  //this.authUser, this.signUpUser
  )
      : super(AlarmsEmptyState());

  Future<void> loadingAlarms() async {

    if ( state is LoadingAlarmsState) {
      return;
    }
    final currentState = state;
    var alarms = <AlarmEntity>[];

    if(currentState is LoadedAlarmsState){
      alarms = currentState.alarms;
    }
    emit(LoadingAlarmsState(alarms));

    final failureOrAlarms = await getAlarms(null);

    failureOrAlarms.fold((error) => emit (ErrorState(message: _mapFailureToMessage(error))), (alarms) {
      final alarmsList = (state as LoadingAlarmsState).alarms;
      alarmsList.addAll(alarms);
      emit(LoadedAlarmsState(alarmsList));
    });
  }

  void writingAlarms(){

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
