import 'package:flutter/foundation.dart';
import 'package:flutter_hooks_sample/screens/signup/model/signup_input.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/utils/hive_hook.dart';
ValueNotifier<SignUpInput?> useSignUpInputNotifier() {
  final notifier = useHiveBoxMap<SignUpInput>(
      'signup-input', 'signup', SignUpInput.fromJson, createNewSignUpInput());
  return notifier;
}

SignUpInput? useSignUpInput() {
  final _notifier = useSignUpInputNotifier();
  final notifier = useMemoized(() => _notifier.value, [_notifier.value]);
  return notifier;
}

ValueNotifier<T?> useHiveBoxMap<T>(String boxName, String key,
    T Function(Map<String, dynamic> map) fromJson, T? initValue) {
  final notifier = useState(initValue);
  use(HiveBoxMapCtrl(
    boxName: boxName,
    key: key,
    initValue: initValue,
    notifier: notifier,
    fromJson: fromJson,
  ));
  return notifier;
}
