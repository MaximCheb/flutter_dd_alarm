import 'package:flutter/material.dart';

import 'common/app_themes.dart';
import 'features/app/data/models/settings_model.dart';
import 'features/classic/presentation/pages/alarms_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlarmApp extends StatelessWidget {
  final SettingsModel settings;
  const AlarmApp({Key? key, required this.settings}) : super(key: key);

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