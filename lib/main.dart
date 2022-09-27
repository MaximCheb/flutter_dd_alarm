import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/classic/presentation/pages/alarms_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates:
        AppLocalizations.localizationsDelegates,
      // locale: const Locale('en'),
      onGenerateTitle: (context) =>
      AppLocalizations.of(context)!.title_app,
      title: "Flutter geo alarm",
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const AlarmPage(),
    );
  }
}

