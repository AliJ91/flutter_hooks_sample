// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/screens/signup/signup.dart';
import 'package:flutter_hooks_sample/screens/splash/splash.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


//  redirect widget that takes a child widget
class RedirectOnJwtExpired extends HookWidget {
  const RedirectOnJwtExpired({Key? key, required this.from, required this.to})
      : super(key: key);

  final Widget from;
  final Widget to;

  @override
  Widget build(BuildContext context) {
    final jwtToken = useJwtToken();
    //  print("Access token::::: ${jwtToken?.accessToken}");
    final lang = useLang();
    final isTokenExpired = useMemoized(
            () => (jwtToken != null && jwtToken.refreshToken.length > 5)
            ? false
            : true,
        [jwtToken, lang]);

    return isTokenExpired ? to : from;
  }
}

class Routes {
  static final router = GoRouter(
    initialLocation: SplashScreen.routeName,
    routes: [

      // SignupScreen
      GoRoute(
          path: SignupScreen.routeName,
          builder: (context, state) => SignupScreen()),
    ],
  );
}
