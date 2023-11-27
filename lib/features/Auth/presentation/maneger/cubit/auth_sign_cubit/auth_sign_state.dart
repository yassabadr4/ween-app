class AuthSignState {}

class AuthSignInitial extends AuthSignState {}

final class SignUpLoadingState extends AuthSignState {}

final class SignUpSuccessState extends AuthSignState {}

final class SignUpFailureState extends AuthSignState {
  final String errMessage;

  SignUpFailureState(this.errMessage);
}

final class SignInLoadingState extends AuthSignState {}

final class SignInSuccessState extends AuthSignState {}

final class SignInFailureState extends AuthSignState {
  final String errMessage;

  SignInFailureState(this.errMessage);
}
