// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


class SplashScreen extends HookWidget {
  const SplashScreen({Key? key})
      : super(
    key: key,
  );

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    useMemoized(() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      context.replace('/');
    });

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(""),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center, //Center Row contents horizontally,
        mainAxisSize: MainAxisSize.max,
        children: [
         //TODO: add images or whatever u need
        ],
      ),
    );
  }
}
