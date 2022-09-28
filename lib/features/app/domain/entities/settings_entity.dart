import 'package:equatable/equatable.dart';

class SettingsEntity extends Equatable {
  final String? userName;
  final String theme;
  final String font;
  final String lang;

  const SettingsEntity(
      {this.userName,
      required this.theme,
      required this.font,
      required this.lang});

  @override
  // TODO: implement props
  List<Object?> get props => [theme, font, lang];
}
