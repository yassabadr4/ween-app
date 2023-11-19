

abstract class PhoneAuthState {}

class PhoneAuthInitial extends PhoneAuthState {}

class LoadingState extends PhoneAuthState {}

class ErrorOccurred extends PhoneAuthState {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends PhoneAuthState{}

class PhoneOTPVerified extends PhoneAuthState{}