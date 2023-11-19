import 'package:equatable/equatable.dart';

class AuthBlocEvent extends Equatable{
  @override
  List<Object?> get props => [];

}


class LoginEvent extends AuthBlocEvent{
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
  @override
  List<Object?> get props => [email, password];
}