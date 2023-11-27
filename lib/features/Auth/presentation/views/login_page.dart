import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/core/function/app_router.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/auth_sign_cubit/auth_sign_cubit.dart';
import 'package:ween/features/Auth/presentation/views/signup_page.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_password.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_text_from_field.dart';
import 'package:ween/helper/show_snack_bar.dart';

import '../../../../core/componants/buttons/custom_botton.dart';
import '../maneger/cubit/auth_sign_cubit/auth_sign_state.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthSignCubit>(
      create: (context) => AuthSignCubit(),
      child: BlocConsumer<AuthSignCubit, AuthSignState>(
        listener: (context, state) {
          if(state is SignInLoadingState)
          {
            isLoading = true;
          }else if(state is SignInSuccessState ){
            GoRouter.of(context).push(AppRouter.kCreateView);
            isLoading=false;
          }else if(state is SignInFailureState){
            showSnackBar(context, state.errMessage);
            isLoading=false;
          }
        },
        builder: (context, state) {
          AuthSignCubit authSignCubit = BlocProvider.of<AuthSignCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          style: TextStyle(
                            fontSize: 30,
                          ),
                          'تسجيل الدخول',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFromField(
                          labelText: 'Email',
                          onChanged: (email) {
                            authSignCubit.emailAddress = email;
                          },
                          prefixIcon: const Icon(
                            color: Colors.black,
                            Icons.email,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomPassword(
                          labelText: 'Password',
                          onChanged: (password){
                            authSignCubit.password = password;
                          },
                          prefixIcon: const Icon(
                            color: Colors.black,
                            Icons.lock,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        CustomButton(
                          title: 'تسجيل الدخول',
                          onPressd: () {
                            if (formKey.currentState!.validate()) {
                              authSignCubit.loginWithEmailAndPassword();
                            } else {}
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ليس لدي حساب.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const SignUpPage();
                                    }));
                              },
                              child: const Text(
                                'أنشاء حساب',
                                style: TextStyle(
                                  color: kPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
