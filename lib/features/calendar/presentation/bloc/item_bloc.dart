import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'item_event.dart';
part 'item_state.dart';

class CalendarAlarmBloc extends Bloc<CalendarAlarmEvent, CalendarAlarmState> {
  CalendarAlarmBloc() : super(CalendarAlarmInitial()) {
    on<CalendarAlarmEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
