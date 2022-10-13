import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geo_alarm/common/app_themes.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'features/app/data/models/settings_model.dart';
import 'features/classic/presentation/pages/alarms_page.dart';

Future<void> main() async {
  // await di.init();
  SettingsModel settings = await readSettings();
  runApp(AlarmApp( settings: settings,));
}
Future<SettingsModel> readSettings() async {  // bad code? must change
  var docFolder = await getApplicationDocumentsDirectory();
  try {
    //final settingsFile = File('assets/settings.json');
    File settingsFile  = File("${docFolder.path}/.flutter_geo_alarm/settings.json");
    var jsonSettings = await settingsFile.readAsString();
    if (jsonSettings.isNotEmpty) {
      return SettingsModel.fromJson(json.decode(jsonSettings));
    }
  } on FileSystemException {
    var model = SettingsModel(lang: Platform.localeName.substring(0,2),font: "default", theme: 'classic');
     await Directory("${docFolder.path}/.flutter_geo_alarm").create();
     File settingsFile  = File("${docFolder.path}/.flutter_geo_alarm/settings.json");
    settingsFile.writeAsString(json.encode(model.toJson()));
    return model;
  }
  return SettingsModel(lang: Platform.localeName.substring(0,2),font: "default", theme: 'classic');
}


