import 'package:equatable/equatable.dart';

class GeoAlarmEntity extends Equatable {
  final String name;
  final int radius;
  final double cordX;
  final double cordY;
  final String music;

  const GeoAlarmEntity(
      {required this.name,
      required this.radius,
      required this.cordX,
      required this.cordY,
      required this.music});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
