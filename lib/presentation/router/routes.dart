import 'package:go_router/go_router.dart';
import 'package:looksy/presentation/pages/onboarding/login.dart';
import 'package:looksy/presentation/pages/onboarding/onboarding.dart';
import 'package:looksy/presentation/pages/onboarding/otp.dart';
import 'package:looksy/presentation/pages/onboarding/registration.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
        path: '/register',
        builder: (context, state) => const RegistrationPage(),
        routes: [
          GoRoute(
            path: 'otp',
            builder: (context, state) => const OtpPage(),
          ),
        ]),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
  redirect: (context, state) {
    if (state.uri.toString() == '/') {
      return '/onboarding';
    }
    return null;
  },
);

GoRouter getRoute() => _router;
