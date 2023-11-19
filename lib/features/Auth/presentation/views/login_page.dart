import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/core/function/app_router.dart';
import 'package:ween/features/Auth/presentation/views/signup_page.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_password.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_text_from_field.dart';

import '../../../../core/componants/buttons/custom_botton.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                  const CustomTextFromField(
                    labelText: 'Email',
                    prefixIcon: Icon(
                      color: Colors.black,
                      Icons.email,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const CustomPassword(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      color: Colors.black,
                      Icons.lock,
                    ),
                     keyboardType: TextInputType.visiblePassword,
                  ),
                  GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kPhoneAuthView);
                    },
                    child: const Text(
                        'نسيت الرقم السري ؟',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  CustomButton(
                    title: 'تسجيل الدخول',
                    onPressd: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).push(AppRouter.kCreateView);
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
  }
}
