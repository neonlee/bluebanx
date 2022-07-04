import 'package:bluebenx/signin/domain/usecase/signin_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SigninUsecase signinUsecase;
  AuthBloc({required this.signinUsecase}) : super(UnAuthenticated()) {
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      var response =
          await signinUsecase(email: event.email, password: event.password);
      response.fold(
        (failure) => emit(AuthError(failure.message!)),
        (result) => emit(Authenticated()),
      );
    });
  }
}
