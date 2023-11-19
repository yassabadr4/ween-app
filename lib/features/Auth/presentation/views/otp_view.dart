import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:ween/core/componants/buttons/circle_button.dart';
import 'package:ween/core/componants/colors.dart';
import 'package:ween/core/function/app_router.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/phone_auth/auth_cubit.dart';
import 'package:ween/features/Auth/presentation/maneger/cubit/phone_auth/auth_state.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
            listener: (context, state) {
              if (state is PhoneOTPVerified) {
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              } else if (state is ErrorOccurred) {
                // Handle error
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMsg)));
              }
            },
            builder: (context, state) {
              return Column(
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
                        'ادخل الرمز',
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
                  // Text(
                  //   S.of(context).,
                  //   style: const TextStyle(
                  //     color: Colors.grey,
                  //     fontSize: 18,
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(bottom: 40),
                  //   child: const Text(
                  //     "+93 744 795 640",
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 18,
                  //     ),
                  //   ),
                  // ),
                  Pinput(
                    controller: otpController,
                    length: 6,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: kPrimary),
                      ),
                    ),
                    onCompleted: (pin) {
                      final otpCode = otpController.text.trim();
                      if (otpCode.isNotEmpty) {
                        BlocProvider.of<PhoneAuthCubit>(context)
                            .submitOTP(otpCode);
                      }
                    },
                  ),
                  const SizedBox(
                    width: double.maxFinite,
                    height: 50,
                  ),
                  // CustomButton(
                  //   title: 'Done',
                  //   onPressd: () {},
                  // )
                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
