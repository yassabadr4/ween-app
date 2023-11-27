class AuthSignState {}

class AuthSignInitial extends AuthSignState {}

final class SignUpLoadingState extends AuthSignState {}

final class SignUpSuccessState extends AuthSignState {}

final class SignUpFailureState extends AuthSignState {
  final String errMessage;

  SignUpFailureState(this.errMessage);
}
