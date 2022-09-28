import 'package:flutter_geo_alarm/features/app/domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntity {
  const SettingsModel(
      {required super.theme, required super.font, required super.lang});
  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
        theme: json['theme'], font: json['font'], lang: json['lang']);
  }
  Map<String, dynamic> toJson() {
    return {'user_name': userName, 'theme': theme, 'font': font, 'lang': lang};
  }
}
