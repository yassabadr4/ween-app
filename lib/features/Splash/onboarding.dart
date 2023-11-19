import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:ween/core/componants/assets.dart';

import '../../core/componants/buttons/button_card.dart';
import '../../core/componants/colors.dart';
import '../../core/function/app_router.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

bool isOwner = false;
bool isCustomer = false;

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'البدء',
        finishButtonStyle: const FinishButtonStyle(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          backgroundColor: Colors.green,
        ),
        skipTextButton: const Text('تخطي'),
        centerBackground: true,
        controllerColor: Colors.green,
        onFinish: () {
          if (isCustomer == true) {
            GoRouter.of(context).push(AppRouter.kHomeView);
          } else if (isOwner == true) {
            GoRouter.of(context).push(AppRouter.kLogInPage);
          } else {}
          setState(() {});
        },
        background: [
          Image.asset(AssetsData.slide1),
          Image.asset(AssetsData.slide2),
          Image.asset(AssetsData.slide3),
          Image.asset(AssetsData.slide3),
        ],
        totalPage: 4,
        speed: 1.8,
        pageBodies: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(child: Text('Description Text 1')),
              const SizedBox(
                height: 120,
              )
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(child: Text('Description Text 2')),
              const SizedBox(
                height: 120,
              )
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(child: Text('Description Text 3')),
              const SizedBox(
                height: 120,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Description Text 4'),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCard(
                      ontap: () {
                        setState(() {
                          isOwner = false;
                          isCustomer = true;
                        });
                      },
                      color: isCustomer ? kPrimary : Colors.grey,
                      icon: Icons.store,
                      title: 'المحلات'),
                  const SizedBox(
                    width: 16,
                  ),
                  ButtonCard(
                      ontap: () {
                        setState(() {
                          isOwner = true;
                          isCustomer = false;
                        });
                      },
                      color: isOwner ? kPrimary : Colors.grey,
                      icon: Icons.add,
                      title: 'أضافة محل'),
                ],
              ),
              const SizedBox(
                height: 120,
              )
            ],
          ),
        ],
      ),
    );
  }
}
