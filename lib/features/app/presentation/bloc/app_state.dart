import 'package:des_doc_app/features/app/data/models/login_user.dart';
import 'package:des_doc_app/features/app/domain/entities/settings_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

abstract class CheckAppState extends Equatable{
  const  CheckAppState();
  @override
  List<Object?> get props => [];
}
class EmptySettingsState extends CheckAppState{
  @override
  List<Object?> get props => [];
}
class CheckLocalState extends CheckAppState{
  final SettingsEntity settings;

  const CheckLocalState(this.settings);
  @override
  List<Object?> get props => [];
}
class CheckSharedState extends CheckAppState{

  const CheckSharedState();
  @override
  List<Object?> get props => [];
}
class LoadingState extends CheckApp State {
  final LoginUser loginUser;
  final bool isEmptyUserData;

  LoadingState ( this.loginUser, {this.isEmptyUserData = false});
    
  @override
  List<Object?> get props => [loginUser];
}

class LoadedSettingsState extends CheckState {
  final LoginUser user;

  const LoadedSettingsState(this.user);

  @override
  List<Object?> get props => [user];
}

class ErrorAuthState extends CheckState {
  final String message;
  const ErrorAuthState({required this.message});
  
  @override
  List<Object?> get props => [message];
}

