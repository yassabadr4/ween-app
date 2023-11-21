import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ween/core/componants/buttons/custom_botton.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_password.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_text_from_field.dart';

import '../../../../core/function/app_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                    'أضافة حساب',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextFromField(
                    labelText: 'الاسم',
                    prefixIcon: Icon(
                      color: Colors.black,
                      Icons.person,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  const CustomTextFromField(
                    labelText: 'الايميل',
                    prefixIcon: Icon(
                      color: Colors.black,
                      Icons.email,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const CustomTextFromField(
                    labelText: 'رقم الهاتف',
                    prefixIcon: Icon(
                      color: Colors.black,
                      Ionicons.logo_whatsapp,

                    ),

                    keyboardType: TextInputType.phone,
                  ),
                  const CustomPassword(
                    labelText: 'كلمة السر',
                    prefixIcon: Icon(
                      color: Colors.black,
                      Icons.lock_open,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const CustomPassword(
                    labelText: 'اعادة كلمة السر',
                    prefixIcon: Icon(
                      color: Colors.black,
                      Icons.lock,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  CustomButton(
                    title: 'التسجيل الان',
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
  }
}
