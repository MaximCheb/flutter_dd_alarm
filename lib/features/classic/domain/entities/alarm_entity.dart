import 'package:equatable/equatable.dart';

class AlarmEntity extends Equatable {
  final String name;
  final String time;
  final String repeat;
  final String music;
  final List<String> days;

  AlarmEntity(
      {required this.name,
      required this.time,
      required this.repeat,
      required this.music,
      required this.days});

  @override
  // TODO: implement props
  List<Object?> get props => [name,time,repeat,days];
}
