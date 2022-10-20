import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:flutter_geo_alarm/core/usecase/usecase.dart';
import 'package:flutter_geo_alarm/features/app/data/models/settings_model.dart';
import 'package:flutter_geo_alarm/features/app/domain/usecases/settings_usecase.dart';
import 'package:flutter_geo_alarm/features/app/presentation/bloc/app_cubit.dart';
import 'common/app_themes.dart';
import 'features/app/data/datasources/settings_datasource.dart';
import 'features/app/domain/repositories/settings_repository.dart';
import 'features/app/presentation/bloc/app_state.dart';
import 'features/classic/presentation/bloc/alarm_cubit.dart';
import 'features/classic/presentation/pages/alarms_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'locator_service.dart';

class AlarmApp extends StatelessWidget {
  const AlarmApp({Key? key,}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: ((context) => getIt<AppCubit>()..checkSettings())),
          BlocProvider<AlarmCubit>(
          create: ((context) => getIt<AlarmCubit>()..loadingAlarms())),
      ],

      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if(state is LoadedSettingsState){
            return AppWidget(settings: state.settings);
          }
          return LoadingWidget();
        },
        
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  final SettingsModel settings;
  const AppWidget({
    Key? key, required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates:
        AppLocalizations.localizationsDelegates,
      onGenerateTitle: (context) =>
      AppLocalizations.of(context)!.title_app,
      title: "Flutter geo alarm",
      theme: chooseTheme(settings.theme),
      home: const AlarmsPage(),
    );
  }
  Future<SettingsModel> getAppSettings() {
   return getIt<SettingsDataSources>().getSettings();
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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: CircularProgressIndicator(),),
    );
  }
}