import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_geo_alarm/core/usecase/usecase.dart';

import '../../../../core/error/failture.dart';
import '../../data/models/settings_model.dart';
import '../repositories/settings_repository.dart';

class GetSettingsCase extends UseCase<SettingsModel,VoidParam>{
  final SettingsRepository repository;

  GetSettingsCase({required this.repository});
  @override
  Future<Either<Failure, SettingsModel>> call(VoidParam params) {
    return repository.getSettings();
  }  
}

class SetSettingsCase extends UseCase<bool,SettingsParam>{
  final SettingsRepository repository;

  SetSettingsCase({required this.repository});
  @override
  Future<Either<Failure, bool>> call(SettingsParam params) async{
    return await repository.setSettings(params.setting);
  }  
}

class SettingsParam extends Equatable {
  final SettingsModel setting;

  const SettingsParam({required this.setting});

  @override
  List<Object?> get props => [setting];
}

