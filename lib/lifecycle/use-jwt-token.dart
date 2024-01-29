
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/screens/signup/stores/use_signup_input.dart';

ValueNotifier<JwtToken?> useJwtTokenNotifier() {
  final jwtToken =
  useHiveBoxMap<JwtToken>('jwt', 'jwtToken', JwtToken.fromJson, null);
  return jwtToken;
}

JwtToken? useJwtToken() {
  final _jwtToken = useJwtTokenNotifier();
  final jwtToken = useMemoized(() => _jwtToken.value, [_jwtToken.value]);
  return jwtToken;
}

class JwtToken {
  String refreshToken;
  String? accessToken;

  JwtToken({
  required this.refreshToken,
  this.accessToken});
  factory JwtToken.fromJson(Map<String, dynamic> json) {
    return JwtToken(
      refreshToken: json['jsonKey'],
      accessToken: json['jsonKey'],

    );
  }

}
