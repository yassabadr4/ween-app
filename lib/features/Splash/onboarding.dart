import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ween/core/componants/assets.dart';
import 'package:ween/features/Splash/presentation/view/custom_icon.dart';

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

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url,);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )
    ) {
throw 'can not launch url';
    }
  }

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
              Center(
                  child: Text(
                      ' ween app مرحبا ! اكتشف أفضل الخصومات والعروض فقط من',
                      textAlign: TextAlign.center)),
              SizedBox(
                height: 120,
              )
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                  child: Text(
                    'استفد من تنوع الخصومات والعروض المقدمة فى جميع المحلات وعلى جميع الخدمات',
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 120,
              )
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                  child: Text(
                      'استمتع بخصومات حصرية تجعل تسوقك أكثر متعة واقتصادا',
                      textAlign: TextAlign.center)),
              SizedBox(
                height: 120,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'ابدأ الآن',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomIcon(
                  onPressed: () {
                    _launchUrl('https://www.facebook.com/profile.php?id=61551255039332');
                  },
                  icon: const Icon(
                    Icons.facebook,
                    color: kPrimary,
                  ),
                ),
                CustomIcon(
                  onPressed: () {
                    _launchUrl('https://t.me/+MWrMuQOAGAdiODM0');
                  },
                  icon: const Icon(
                    Icons.telegram,
                    color: kPrimary,
                  ),
                ),
                CustomIcon(
                  onPressed: () {
                    _launchUrl('https://www.tiktok.com/@weenapp00?_t=8gBuRy35Dle&_r=1');
                  },
                  icon: const Icon(
                    Icons.tiktok,
                    color: kPrimary,
                  ),
                ),
                CustomIcon(
                  onPressed: () {
                    _launchUrl('https://wa.me/201064669094 ');
                  },
                  icon: const Icon(
                    Ionicons.logo_whatsapp,
                    color: kPrimary,
                  ),
                ),
              ]),
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
