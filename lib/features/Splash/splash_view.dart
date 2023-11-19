import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/componants/assets.dart';
import '../../core/function/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        AssetsData.logo,
        height: 80,
        width: 80,
      )),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kOnBoarding);
    });
  }
}
