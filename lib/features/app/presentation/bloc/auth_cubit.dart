import 'package:des_doc_app/core/error/failure.dart';
import 'package:des_doc_app/features/app/data/models/login_user.dart';
import 'package:des_doc_app/features/app/domain/usercase/auth_user_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetAuthUserCase authUser;
  final SignupUserCase signUpUser;

  AuthCubit(AuthState initialState, this.authUser, this.signUpUser)
      : super(initialState);

  void signinUser(){
    if ( state is LoadingAuthState) {
      return;
    }
    if ( state is EmptyAuthState) {
      emit(SearchAuthState());
      return;
    }
    final currentState = state;
    if ( state is LoadingAuthState) {
      return;
    }

  }
  void signupUser(){

  }
  _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server failure';
      case CacheFailure:
        return 'Cache failure';
      default:
        return "Unexpected failure";
    }
  }
}
