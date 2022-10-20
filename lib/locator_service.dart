import 'package:flutter_geo_alarm/features/app/data/datasources/settings_datasource.dart';
import 'package:flutter_geo_alarm/features/app/data/repositories/settings_repository.dart';
import 'package:flutter_geo_alarm/features/app/domain/repositories/settings_repository.dart';
import 'package:flutter_geo_alarm/features/app/domain/usecases/settings_usecase.dart';
import 'package:flutter_geo_alarm/features/app/presentation/bloc/app_cubit.dart';
import 'package:flutter_geo_alarm/features/classic/data/datasources/alarm_local_datasource.dart';
import 'package:flutter_geo_alarm/features/classic/data/repositories/alarm_repository_impl.dart';
import 'package:flutter_geo_alarm/features/classic/presentation/bloc/alarm_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http/http.dart' as http; // must add http to pubspec.yaml
import 'features/classic/domain/repositories/alarm_repository.dart';
import 'features/classic/domain/usecases/alarms_usercases.dart';
import 'features/geo/presentation/bloc/geo_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async{
  
  
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);
  //getIt.registerLazySingleton(() => http.Client());
  // getIt.registerLazySingleton(() => InternetConnectionChecker());

  getIt.registerFactory(() => CheckAppCubit( getIt()));
  getIt.registerFactory(() => AppCubit(settingsCase: getIt()));
  getIt.registerFactory(() => AlarmCubit(getIt(), getIt()));
  //Datasource
  getIt.registerLazySingleton<AlarmDatasource>(()=>AlarmDatasourceImpl());
  getIt.registerLazySingleton<SettingsDataSources>(() => SettingsDataSourcesImpl());
  //Repository
  getIt.registerLazySingleton<AlarmRepository>(() => AlarmRepositoryImpl(alarmDatasource: getIt()));
  getIt.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(settingsDataSources: getIt()));
  //UseCase
  getIt.registerLazySingleton(() => GetAllAlarms(repository: getIt()));
  getIt.registerLazySingleton(() => WriteAllAlarms(repository: getIt()));
  getIt.registerLazySingleton(() => GetSettingsCase(repository: getIt()));
  getIt.registerLazySingleton(() => SetSettingsCase(repository: getIt()));
}