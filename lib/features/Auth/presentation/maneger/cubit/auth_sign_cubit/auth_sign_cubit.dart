import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/auth_sign_cubit/auth_sign_state.dart';


class AuthSignCubit extends Cubit<AuthSignState> {
  AuthSignCubit() : super(AuthSignInitial());

  String? name;
  String? emailAddress;
  String? phone;
  String? password;
  String? passwordConfirm;

  Future<void> loginWithEmailAndPassword() async {
    emit(SignInLoadingState());
    try {
       await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress!, password: password!);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState('user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState('wrong-password'));
      }
    } catch (e) {
      emit(SignInFailureState(e.toString()));
    }
  }

   Future <void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState('الرفم السري ضعيف جدا'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState('هذا الايميل تم استخدامه من قبل'));
      }
    } catch (e) {
      print(e.toString());
      emit(SignUpFailureState(e.toString()));
    }
  }
}


