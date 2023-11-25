

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ween/Api/api.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/login_auth/login_event.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/login_auth/login_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  // API Service to make signup requests
  final DioHelper _apiService;

  SignUpBloc({required DioHelper apiService})
      : _apiService = apiService,
        super(SignUpInitial());

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();
      try {
        // Make API call for sign-up
        // await _apiService.signUp(event.email, event.password);
        yield SignUpSuccess();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}