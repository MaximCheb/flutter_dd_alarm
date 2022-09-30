import 'package:des_doc_app/features/app/data/models/login_user.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable{
  const  AuthState();
  @override
  List<Object?> get props => [];
}
class SearchAuthState extends AuthState{
  @override
  List<Object?> get props => [];
}
class EmptyAuthState extends AuthState{
  @override
  List<Object?> get props => [];
}
class SignupState extends AuthState{
  final UserEntity user;

  const SignupState(this.user);
  @override
  List<Object?> get props => [];
}
class LoadingAuthState extends AuthState {
  final LoginUser loginUser;
  final bool isEmptyUserData;

  LoadingAuthState ( this.loginUser, {this.isEmptyUserData = false});
    
  @override
  List<Object?> get props => [loginUser];
}

class LoadedAuthState extends AuthState {
  final LoginUser user;

  const LoadedAuthState(this.user);

  @override
  List<Object?> get props => [user];
}

class ErrorAuthState extends AuthState {
  final String message;
  const ErrorAuthState({required this.message});
  
  @override
  List<Object?> get props => [message];
}

