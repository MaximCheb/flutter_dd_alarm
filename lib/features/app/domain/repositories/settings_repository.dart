import 'package:dartz/dartz.dart';
import 'package:flutter_geo_alarm/core/error/failture.dart';

import '../../data/models/settings_model.dart';

abstract class SettingsRepository {
  //Future<Either<Failure,List<ProjectModel>>> getAllProject(int page);
  Future<Either<Failure, SettingsModel>> getSettings();
  Future<Either<Failure, bool>> setSettings(SettingsModel settings);
}