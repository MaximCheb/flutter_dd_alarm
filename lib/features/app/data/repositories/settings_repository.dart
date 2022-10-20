import 'package:dartz/dartz.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';
import 'package:flutter_geo_alarm/features/app/data/datasources/settings_datasource.dart';
import 'package:flutter_geo_alarm/features/app/domain/repositories/settings_repository.dart';

import '../models/settings_model.dart';

class SettingsRepositoryImpl extends SettingsRepository{
  final SettingsDataSources settingsDataSources;

  SettingsRepositoryImpl({required this.settingsDataSources});
  
  @override
  Future<Either<Failure, SettingsModel>> getSettings() async {
    try {
      final SettingsModel settings = await settingsDataSources.getSettings();
      return Right(settings);
    } on Exception {
      return Left(FileFailure());
    }    
  }

  @override
  Future<Either<Failure, bool>> setSettings(settings) async {
    try {
      await settingsDataSources.rewriteSettings(settings);
      return const Right(true);
    } on Exception {
      return Left(FileFailure());
    }
  }
 
}