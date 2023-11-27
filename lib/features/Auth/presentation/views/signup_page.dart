import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ween/core/componants/buttons/custom_botton.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/auth_sign_cubit/auth_sign_cubit.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/auth_sign_cubit/auth_sign_state.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_password.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_text_from_field.dart';
import 'package:ween/helper/show_snack_bar.dart';

import '../../../../core/function/app_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey();
 bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthSignCubit>(
      create: (context) => AuthSignCubit(),
      child: BlocConsumer<AuthSignCubit, AuthSignState>(
        listener: (context, state) {
          if(state is SignUpLoadingState)
          {
            isLoading = true;
          }else if(state is SignUpSuccessState ){
            GoRouter.of(context).push(AppRouter.kCreateView);
            isLoading=false;
          }else if(state is SignUpFailureState){
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
                          'أضافة حساب',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         CustomTextFromField(
                          labelText: 'الاسم',
                          onChanged: (name)
                          {
                            authSignCubit.name = name;
                          },
                          prefixIcon: const Icon(
                            color: Colors.black,
                            Icons.person,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                         CustomTextFromField(
                          labelText: 'الايميل',
                          onChanged: (email)
                          {
                            authSignCubit.emailAddress = email;
                          },
                          prefixIcon: const Icon(
                            color: Colors.black,
                            Icons.email,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                         CustomTextFromField(
                          labelText: 'رقم الهاتف',
                          onChanged: (phone){
                            authSignCubit.phone = phone;
                          },
                          prefixIcon: const Icon(
                            color: Colors.black,
                            Ionicons.logo_whatsapp,

                          ),

                          keyboardType: TextInputType.phone,
                        ),
                         CustomPassword(
                          labelText: 'كلمة السر',
                          onChanged: (password)
                          {
                            authSignCubit.password = password;
                          },
                          prefixIcon: const Icon(
                            color: Colors.black,
                            Icons.lock_open,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                         CustomPassword(
                          labelText: 'اعادة كلمة السر',
                          onChanged: (passwordConfirm){
                            authSignCubit.passwordConfirm = passwordConfirm;
                          },
                          prefixIcon: const Icon(
                            color: Colors.black,
                            Icons.lock,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        CustomButton(
                          title: 'التسجيل الان',
                          onPressd: () {
                            if (formKey.currentState!.validate()) {
                              authSignCubit.signUpWithEmailAndPassword();
                            } else {}
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             const Text(
                              'أنا بالفعل لدي حساب .',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                    color: kPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
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
