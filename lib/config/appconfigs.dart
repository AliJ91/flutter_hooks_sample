

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// AppConfig class is used to get the app configuration from the .env file
// create a factory constructor to return the instance of the class using the
// data from the .env file
class AppConfig extends InheritedWidget {
  // constructor
  const AppConfig({
    Key? key,
    required Widget child,
    required this.appName,
    required this.flavor,
    required this.mainAppGqlUrl,
    required this.realtimeAppGqlUrl,
    // required this.googleMapsApiKey,
    required this.sentryDsn,
    required this.mainAppGqlWssUrl,
    required this.realtimeAppGqlWssUrl,
  }) : super(key: key, child: child);

  final String appName;
  final String flavor;
  final String mainAppGqlUrl;
  final String realtimeAppGqlUrl;
  //final String googleMapsApiKey;
  final String sentryDsn;
  final String mainAppGqlWssUrl;
  final String realtimeAppGqlWssUrl;

  // get the app config from the .env file
  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }

  // check if the app config is changed
  @override
  bool updateShouldNotify(AppConfig oldWidget) {
    return appName != oldWidget.appName ||
        flavor != oldWidget.flavor ||
        mainAppGqlUrl != oldWidget.mainAppGqlUrl ||
        realtimeAppGqlUrl != oldWidget.realtimeAppGqlUrl ||
        sentryDsn != oldWidget.sentryDsn ||
        mainAppGqlWssUrl != oldWidget.mainAppGqlWssUrl ||
        realtimeAppGqlWssUrl != oldWidget.realtimeAppGqlWssUrl;
  }

  // factory constructor to return the instance of the class using the
  // data from the .env file
  factory AppConfig.fromEnvironment(Widget child) {
    return AppConfig(
      appName: dotenv.get(''),
      flavor: dotenv.get(''),
      mainAppGqlUrl: dotenv.get(''),
      realtimeAppGqlUrl: dotenv.get(''),
      sentryDsn: dotenv.get(''),
      mainAppGqlWssUrl: dotenv.get(''),
      realtimeAppGqlWssUrl: dotenv.get(''),
      child: child,
    );
  }
}
