import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/auth_sign_cubit/auth_sign_state.dart';


class AuthSignCubit extends Cubit<AuthSignState> {
  AuthSignCubit() : super(AuthSignInitial());

  String? firstName;
  String? emailAddress;
  String? phone;
  String? password;
  String? passwordConfirm;
  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState('The account already exists for that email.'));
      }
    } catch (e) {
      print(e.toString());
      emit(SignUpFailureState(e.toString()));
    }
  }
}
