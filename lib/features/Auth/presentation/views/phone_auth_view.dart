import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:ween/core/componants/buttons/circle_button.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/phone_auth/auth_cubit.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/phone_auth/auth_state.dart';
import 'package:ween/features/Auth/presentation/views/widgets/custom_phone_field.dart';
import '../../../../core/componants/buttons/custom_botton.dart';
import '../../../../core/function/app_router.dart';

class PhoneAuthView extends StatefulWidget {
  const PhoneAuthView({super.key});

  @override
  State<PhoneAuthView> createState() => _PhoneAuthViewState();
}

class _PhoneAuthViewState extends State<PhoneAuthView> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneNumberController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 45,
    height: 50,
    textStyle: const TextStyle(
        color: kPrimary, fontWeight: FontWeight.bold, fontSize: 25),
    decoration: BoxDecoration(
      color: kSecondary,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: const Color.fromARGB(51, 158, 158, 158)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneNumberSubmited) {
          GoRouter.of(context).push(AppRouter.kOtpView);
        } else if (state is PhoneOTPVerified) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is ErrorOccurred) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleButton(
                          icon: Icons.arrow_back,
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        const Text(
                          'الدخول برقم الهاتف',
                          style: TextStyle(
                              color: kPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomPhoneFromField(
                      controller: phoneNumberController,
                      labelText: 'رقم الهاتف',
                    ),
                    const SizedBox(
                      width: double.maxFinite,
                      height: 50,
                    ),
                    CustomButton(
                      title: 'ارسل الكود',
                      onPressd: () {
                        final phoneNumber = phoneNumberController.text.trim();
                        if (phoneNumber.isNotEmpty) {
                          BlocProvider.of<PhoneAuthCubit>(context)
                              .submitPhoneNumber(phoneNumber);
                        }
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
