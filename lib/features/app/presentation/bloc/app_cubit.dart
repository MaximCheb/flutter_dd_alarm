
import 'package:flutter_bloc/flutter_bloc.dart';



class CheckAppCubit extends Cubit<CheckAppState> {
  final GetAuthUserCase authUser;
  final SignupUserCase signUpUser;

  CheckCubit(CheckState initialState, this.authUser, this.signUpUser)
      : super(initialState);

  void signinUser(){
    if ( state is CheckLocalState) {
      return;
    }
    if ( state is EmptySettingsState) {
      emit(CheckSharedState());
      return;
    }
    final currentState = state;
    if ( state is LoadedSettingsState) {
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
