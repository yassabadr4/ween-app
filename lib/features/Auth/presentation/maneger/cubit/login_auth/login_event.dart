abstract class SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {
  final String email;
  final String password;

  SignUpButtonPressed({required this.email, required this.password});
}













// import 'package:equatable/equatable.dart';
//
// class AuthBlocEvent extends Equatable{
//   @override
//   List<Object?> get props => [];
//
// }
//
//
// class LoginEvent extends AuthBlocEvent{
//   final String email;
//   final String password;
//
//   LoginEvent(this.email, this.password);
//   @override
//   List<Object?> get props => [email, password];
// }