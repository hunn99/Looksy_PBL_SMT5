import 'package:go_router/go_router.dart';
import 'package:looksy/presentation/pages/history/historypage.dart';
import 'package:looksy/presentation/pages/navigation/navigation.dart';
import 'package:looksy/presentation/pages/onboarding/login.dart';
import 'package:looksy/presentation/pages/onboarding/onboarding.dart';
import 'package:looksy/presentation/pages/onboarding/otp.dart';
import 'package:looksy/presentation/pages/onboarding/registration.dart';
import 'package:looksy/presentation/pages/scan/scan.dart';

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
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const NavigationPage(),
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const ScanPage(),
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
