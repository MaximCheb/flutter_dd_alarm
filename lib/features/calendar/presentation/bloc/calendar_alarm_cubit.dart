
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import '../../domain/entities/calendar_setting_entity.dart';
import '../../domain/usecases/calendar_usercases.dart';
import 'calendar_alarm_state.dart';



class CalendarAlarmCubit extends Cubit<CalendarState> {
  final GetAllCalendarAlarms getAlarms;
  final WriteAllCalendarAlarms writeAlarms;

  CalendarAlarmCubit( this.getAlarms, this.writeAlarms,
  //this.authUser, this.signUpUser
  )
      : super(AlarmsEmptyState());

  Future<void> loadingAlarms() async {

    if ( state is LoadingAlarmsState) {
      return;
    }
    final currentState = state;
    var alarms = <CalendarAlarmEntity>[];

    if(currentState is LoadedAlarmsState){
      alarms = currentState.alarms;
    }
    emit(LoadingAlarmsState(alarms));

    final failureOrAlarms = await getAlarms(null);

    failureOrAlarms.fold((error) => emit (ErrorState(message: _mapFailureToMessage(error))), (character) {
      final alarmsList = (state as LoadingAlarmsState).alarms;
      alarmsList.addAll(character);
      print('List length: ${alarmsList.length.toString()}');
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
