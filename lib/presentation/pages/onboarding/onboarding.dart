import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:looksy/presentation/utils/theme.dart';
// import 'package:looksy/presentation/utils/theme.dart';
import 'package:looksy/presentation/widgets/button/button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Stack(
          children: [
            Image.asset(
              'assets/images/Foto.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Opacity(
                opacity: 0.4,
                child: Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width)),
            Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24, top: 64, bottom: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/Logo_white.png',
                    height: 40,
                  ),
                  Column(children: [
                    const Text(
                      'Find Your Perfect Look in a Snap!',
                      style: TextStyle(
                          fontSize: 44,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -2),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Button(
                      label: 'Get Started',
                      onTap: () {
                        context.push('/register');
                      },
                      isDisabled: false,
                      colorBackground: Colors.white,
                      colorText: neutralTheme,
                    ),
                  ])
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
