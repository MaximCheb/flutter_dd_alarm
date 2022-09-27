import 'package:equatable/equatable.dart';

class CalendarAlarmEntity extends Equatable {
  final String name;
  final List<DateTime> period;
  final int repeat;
  final String music;
  final String interval;
  final List<DayAlarmEntity> times;

  const CalendarAlarmEntity(
      {required this.name,
      required this.period,
      required this.repeat,
      required this.music,
      required this.interval,
      required this.times});

  @override
  // TODO: implement props
  List<Object?> get props => [name,repeat,interval, times];
}

class DayAlarmEntity {
  final String name;
  final String time;

  const DayAlarmEntity({required this.name, required this.time});
}
