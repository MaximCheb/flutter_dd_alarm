import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_geo_alarm/common/app_themes.dart';
import 'features/app/data/models/settings_model.dart';
import 'features/classic/presentation/pages/alarms_page.dart';

Future<void> main() async {
  // await di.init();
  SettingsModel settings = await readSettings();
  runApp(MyApp( settings: settings,));
}
Future<SettingsModel> readSettings() async {
  try {
    final settingsFile = File('assets/settings.json');
    var jsonSettings = await settingsFile.readAsString();
    if (jsonSettings.isNotEmpty) {
      return SettingsModel.fromJson(json.decode(jsonSettings));
    }
  } catch (error) {
    return SettingsModel(lang: Platform.localeName,font: "default", theme: 'classic');
  }
  return SettingsModel(lang: Platform.localeName,font: "default", theme: 'classic');
}
class MyApp extends StatelessWidget {
  final SettingsModel settings;
  const MyApp({Key? key, required this.settings}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates:
        AppLocalizations.localizationsDelegates,
      locale: Locale(settings.lang),
      onGenerateTitle: (context) =>
      AppLocalizations.of(context)!.title_app,
      title: "Flutter geo alarm",
      theme: chooseTheme(settings.theme),
      home: const AlarmsPage(),
    );
  }

  ThemeData chooseTheme(String theme){
    switch (theme){
      case("classic"):
        return AppTheme.classicTheme();
        break;
      case("dark"):
        return AppTheme.darkTheme();
      case("grey"):
        return AppTheme.blueGrey();
      case("blue"):
        return AppTheme.lightBlueTheme();
      default:
        return AppTheme.classicTheme();

    }
  }
}

