// hive related hooks

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


// useBox opens the box and closes it when it no longer needed
// it uses useFuture to open the box and returns the box
// it uses useEffect to close the box when the widget is disposed
// it returns a Box<T> which is a wrapper around the Hive Box

class BoxCtrl {
  static Map<String, int> boxRequesters = {};
}

class HiveBoxCtrl<T> extends Hook<void> {
  final String boxName;
  final String key;
  final T? initValue;
  final ValueNotifier<T?> notifier;

  const HiveBoxCtrl({
    required this.boxName,
    required this.key,
    required this.initValue,
    required this.notifier,
  });

  @override
  HiveBoxCtrlState<T> createState() => HiveBoxCtrlState<T>();
}

class HiveBoxCtrlState<T> extends HookState<void, HiveBoxCtrl<T>> {
  // late ValueNotifier<T?> notifier;
  ValueListenable<Box<dynamic>>? listenable;

  listenerCallback() {
    if (!Hive.isBoxOpen(hook.boxName)) {
      return;
    }
    var currentVal =
    Hive.box(hook.boxName).get(hook.key, defaultValue: hook.initValue);
    var newVal = hook.notifier.value;
    if (deepEquals(currentVal, newVal)) {
      return;
    }

    Hive.box(hook.boxName).put(hook.key, hook.notifier.value);
  }

  @override
  void initHook() {
    super.initHook();
    // notifier = ValueNotifier<T?>(hook.initValue);

    hook.notifier.addListener(listenerCallback);

    Hive.openBox(hook.boxName).then((value) {
      hook.notifier.value =
          Hive.box(hook.boxName).get(hook.key, defaultValue: hook.initValue);

      listenable = Hive.box(hook.boxName).listenable(keys: [hook.key]);
      listenable?.addListener(this.boxListener);
    });
  }

  void boxListener() {
    try {
      var val =
      Hive.box(hook.boxName).get(hook.key, defaultValue: hook.initValue);

      hook.notifier.value = val as T;
    } catch (e) {
      //print(e);
    }
  }

  @override
  ValueNotifier<T?> build(BuildContext context) {
    return hook.notifier;
  }

  @override
  void dispose() {
    hook.notifier.removeListener(listenerCallback);
    listenable?.removeListener(boxListener);
  }
}

ValueNotifier<T?> useHiveBox<T>(String boxName, String key, T initValue) {
  final notifier = useState(initValue);
  use(HiveBoxCtrl(
    boxName: boxName,
    key: key,
    initValue: initValue,
    notifier: notifier,
  ));
  return notifier;
}

///////

class HiveBoxMapCtrl<T> extends Hook<void> {
  final String boxName;
  final String key;
  final T Function(Map<String, dynamic> map) fromJson;
  final T? initValue;
  final ValueNotifier<T?> notifier;

  const HiveBoxMapCtrl({
    required this.boxName,
    required this.key,
    this.initValue,
    required this.notifier,
    required this.fromJson,
  });

  @override
  HiveBoxMapCtrlState<T> createState() => HiveBoxMapCtrlState<T>();
}

class HiveBoxMapCtrlState<T> extends HookState<void, HiveBoxMapCtrl<T>> {
  // late ValueNotifier<T?> notifier;
  ValueListenable<Box<dynamic>>? listenable;

  listenerCallback() {
    //print('hook.notifier listener');
    if (!Hive.isBoxOpen(hook.boxName)) {
      return;
    }
    var currentVal = Hive.box(hook.boxName)
        .get(hook.key, defaultValue: (hook.initValue as dynamic)?.toJson());
    var newVal = (hook.notifier.value as dynamic)?.toJson();
    if (deepEquals(currentVal, newVal)) {
      return;
    }

    Hive.box(hook.boxName).put(
        hook.key,
        hook.notifier.value != null
            ? (hook.notifier.value as dynamic)?.toJson()
            : null);
  }

  @override
  void initHook() {
    super.initHook();
    // notifier = ValueNotifier<T?>(hook.initValue);

    hook.notifier.addListener(listenerCallback);

    Hive.openBox(hook.boxName).then((value) {
      var val = Hive.box(hook.boxName)
          .get(hook.key, defaultValue: (hook.initValue as dynamic)?.toJson());
      hook.notifier.value = val == null ? null : hook.fromJson(convertMap(val));

      listenable = Hive.box(hook.boxName).listenable(keys: [hook.key]);
      listenable?.addListener(this.boxListener);
    });

    // Hive.box(hook.boxName).get(hook.key, defaultValue: hook.initValue);
  }

  void boxListener() {
    try {
      var val = Hive.box(hook.boxName)
          .get(hook.key, defaultValue: (hook.initValue as dynamic)?.toJson());

      hook.notifier.value = val == null ? null : hook.fromJson(convertMap(val));
    } catch (e) {
      //print(e);
    }
  }

  @override
  ValueNotifier<T?> build(BuildContext context) {
    return hook.notifier;
  }

  @override
  void dispose() {
    hook.notifier.removeListener(listenerCallback);
    listenable?.removeListener(boxListener);
  }

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



class HiveBoxMapListCtrl<T> {
  // List<ValueNotifier<T?>> useMultiKeyBoxJsonValue<T>
  String boxName;
  List<String> keys;
  T Function(Map<String, dynamic> map) fromJson;
  dynamic initValue;

  List<ValueNotifier<T?>> notifiers = [];
  ValueListenable<Box<dynamic>>? listenable;

  List? notifiersListeners = [];

  HiveBoxMapListCtrl({
    required this.boxName,
    required this.keys,
    required this.fromJson,
    required this.initValue,
  }) {
    notifiers = List.filled(keys.length, initValue as T)
        .map((e) => ValueNotifier(e))
        .toList();

    for (var i = 0; i < keys.length; i++) {
      notifiersListeners?.add(() {
        if (!Hive.isBoxOpen(boxName)) {
          return;
        }
        var currentVal =
        Hive.box(boxName).get(keys[i], defaultValue: initValue?.toJson());
        var newVal = (notifiers[i].value as dynamic)?.toJson();
        if (deepEquals(currentVal, newVal)) {
          return;
        }
        Hive.box(boxName).put(
            keys[i],
            notifiers[i].value != null
                ? (notifiers[i].value as dynamic)?.toJson()
                : null);
      });

      notifiers[i].addListener(notifiersListeners?[i]);
    }

    Hive.openBox(boxName).then((value) {
      for (var i = 0; i < keys.length; i++) {
        var val =
        Hive.box(boxName).get(keys[i], defaultValue: initValue?.toJson());
        notifiers[i].value = val == null ? null : fromJson(convertMap(val));
      }
      listenable = Hive.box(boxName).listenable(keys: keys);
      listenable?.addListener(this.boxListener);
    });
  }

  void boxListener() {
    try {
      for (var i = 0; i < keys.length; i++) {
        var val =
        Hive.box(boxName).get(keys[i], defaultValue: initValue?.toJson());

        notifiers[i].value = val == null ? null : fromJson(convertMap(val));
      }
    } catch (e) {
      if (kDebugMode) {
        //print(e);
      }
    }
  }

  void dispose() {
    for (var i = 0; i < keys.length; i++) {
      notifiers[i].removeListener(notifiersListeners?[i]);
    }
    listenable?.removeListener(boxListener);
  }
}

List<ValueNotifier<T?>> useHiveBoxMapList<T>(String boxName, List<String> keys,
    T Function(Map<String, dynamic> map) fromJson,
    {dynamic initValue}) {
  final result = HiveBoxMapListCtrl(
      boxName: boxName, keys: keys, fromJson: fromJson, initValue: initValue);

  useEffect(() {
    return () {
      result.dispose();
    };
  }, []);

  return result.notifiers;
}


Map<String, dynamic> convertMap(Map<dynamic, dynamic> map) {
  Map<String, dynamic> newMap = {};
  map.forEach((key, value) {
    if (value is Map<dynamic, dynamic>) {
      newMap[key] = convertMap(value);
    } else if (value is List<dynamic>) {
      newMap[key] = value.map((e) => convertMap(e)).toList();
    } else {
      newMap[key] = value;
    }
  });
  return newMap;
}



bool deepEquals(dynamic a, dynamic b) {
  if (a is Map && b is Map) {
    if (a.length != b.length) return false;
    for (var key in a.keys) {
      if (!b.containsKey(key)) return false;
      if (!deepEquals(a[key], b[key])) return false;
    }
    return true;
  } else if (a is List && b is List) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (!deepEquals(a[i], b[i])) return false;
    }
    return true;
  } else {
    return a == b;
  }
}
