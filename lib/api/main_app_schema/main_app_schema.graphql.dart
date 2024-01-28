class Input$AddressCreateInput {
  factory Input$AddressCreateInput({
    String? block,
    String? building,
    String? flat,
    String? floor,
    String? id,
    bool? isPrimary,
    String? name,
    String? street,
    String? way,
  }) =>
      Input$AddressCreateInput._({
        if (block != null) r'block': block,
        if (building != null) r'building': building,
        if (flat != null) r'flat': flat,
        if (floor != null) r'floor': floor,
        if (id != null) r'id': id,
        if (isPrimary != null) r'isPrimary': isPrimary,
        if (name != null) r'name': name,
        if (street != null) r'street': street,
        if (way != null) r'way': way,
      });

  Input$AddressCreateInput._(this._$data);

  factory Input$AddressCreateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('block')) {
      final l$block = data['block'];
      result$data['block'] = (l$block as String?);
    }
    if (data.containsKey('building')) {
      final l$building = data['building'];
      result$data['building'] = (l$building as String?);
    }
    if (data.containsKey('flat')) {
      final l$flat = data['flat'];
      result$data['flat'] = (l$flat as String?);
    }
    if (data.containsKey('floor')) {
      final l$floor = data['floor'];
      result$data['floor'] = (l$floor as String?);
    }
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('isPrimary')) {
      final l$isPrimary = data['isPrimary'];
      result$data['isPrimary'] = (l$isPrimary as bool?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('street')) {
      final l$street = data['street'];
      result$data['street'] = (l$street as String?);
    }
    if (data.containsKey('way')) {
      final l$way = data['way'];
      result$data['way'] = (l$way as String?);
    }
    return Input$AddressCreateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get block => (_$data['block'] as String?);

  String? get building => (_$data['building'] as String?);

  String? get flat => (_$data['flat'] as String?);

  String? get floor => (_$data['floor'] as String?);

  String? get id => (_$data['id'] as String?);

  bool? get isPrimary => (_$data['isPrimary'] as bool?);

  String? get name => (_$data['name'] as String?);

  String? get street => (_$data['street'] as String?);

  String? get way => (_$data['way'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('block')) {
      final l$block = block;
      result$data['block'] = l$block;
    }
    if (_$data.containsKey('building')) {
      final l$building = building;
      result$data['building'] = l$building;
    }
    if (_$data.containsKey('flat')) {
      final l$flat = flat;
      result$data['flat'] = l$flat;
    }
    if (_$data.containsKey('floor')) {
      final l$floor = floor;
      result$data['floor'] = l$floor;
    }
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('isPrimary')) {
      final l$isPrimary = isPrimary;
      result$data['isPrimary'] = l$isPrimary;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('street')) {
      final l$street = street;
      result$data['street'] = l$street;
    }
    if (_$data.containsKey('way')) {
      final l$way = way;
      result$data['way'] = l$way;
    }
    return result$data;
  }

  CopyWith$Input$AddressCreateInput<Input$AddressCreateInput> get copyWith =>
      CopyWith$Input$AddressCreateInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$AddressCreateInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$block = block;
    final lOther$block = other.block;
    if (_$data.containsKey('block') != other._$data.containsKey('block')) {
      return false;
    }
    if (l$block != lOther$block) {
      return false;
    }
    final l$building = building;
    final lOther$building = other.building;
    if (_$data.containsKey('building') !=
        other._$data.containsKey('building')) {
      return false;
    }
    if (l$building != lOther$building) {
      return false;
    }
    final l$flat = flat;
    final lOther$flat = other.flat;
    if (_$data.containsKey('flat') != other._$data.containsKey('flat')) {
      return false;
    }
    if (l$flat != lOther$flat) {
      return false;
    }
    final l$floor = floor;
    final lOther$floor = other.floor;
    if (_$data.containsKey('floor') != other._$data.containsKey('floor')) {
      return false;
    }
    if (l$floor != lOther$floor) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$isPrimary = isPrimary;
    final lOther$isPrimary = other.isPrimary;
    if (_$data.containsKey('isPrimary') !=
        other._$data.containsKey('isPrimary')) {
      return false;
    }
    if (l$isPrimary != lOther$isPrimary) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (_$data.containsKey('street') != other._$data.containsKey('street')) {
      return false;
    }
    if (l$street != lOther$street) {
      return false;
    }
    final l$way = way;
    final lOther$way = other.way;
    if (_$data.containsKey('way') != other._$data.containsKey('way')) {
      return false;
    }
    if (l$way != lOther$way) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$block = block;
    final l$building = building;
    final l$flat = flat;
    final l$floor = floor;
    final l$id = id;
    final l$isPrimary = isPrimary;
    final l$name = name;
    final l$street = street;
    final l$way = way;
    return Object.hashAll([
      _$data.containsKey('block') ? l$block : const {},
      _$data.containsKey('building') ? l$building : const {},
      _$data.containsKey('flat') ? l$flat : const {},
      _$data.containsKey('floor') ? l$floor : const {},
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('isPrimary') ? l$isPrimary : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('street') ? l$street : const {},
      _$data.containsKey('way') ? l$way : const {},
    ]);
  }
}

abstract class CopyWith$Input$AddressCreateInput<TRes> {
  factory CopyWith$Input$AddressCreateInput(
    Input$AddressCreateInput instance,
    TRes Function(Input$AddressCreateInput) then,
  ) = _CopyWithImpl$Input$AddressCreateInput;

  factory CopyWith$Input$AddressCreateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AddressCreateInput;

  TRes call({
    String? block,
    String? building,
    String? flat,
    String? floor,
    String? id,
    bool? isPrimary,
    String? name,
    String? street,
    String? way,
  });
}

class _CopyWithImpl$Input$AddressCreateInput<TRes>
    implements CopyWith$Input$AddressCreateInput<TRes> {
  _CopyWithImpl$Input$AddressCreateInput(
    this._instance,
    this._then,
  );

  final Input$AddressCreateInput _instance;

  final TRes Function(Input$AddressCreateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? block = _undefined,
    Object? building = _undefined,
    Object? flat = _undefined,
    Object? floor = _undefined,
    Object? id = _undefined,
    Object? isPrimary = _undefined,
    Object? name = _undefined,
    Object? street = _undefined,
    Object? way = _undefined,
  }) =>
      _then(Input$AddressCreateInput._({
        ..._instance._$data,
        if (block != _undefined) 'block': (block as String?),
        if (building != _undefined) 'building': (building as String?),
        if (flat != _undefined) 'flat': (flat as String?),
        if (floor != _undefined) 'floor': (floor as String?),
        if (id != _undefined) 'id': (id as String?),
        if (isPrimary != _undefined) 'isPrimary': (isPrimary as bool?),
        if (name != _undefined) 'name': (name as String?),
        if (street != _undefined) 'street': (street as String?),
        if (way != _undefined) 'way': (way as String?),
      }));
}

class _CopyWithStubImpl$Input$AddressCreateInput<TRes>
    implements CopyWith$Input$AddressCreateInput<TRes> {
  _CopyWithStubImpl$Input$AddressCreateInput(this._res);

  TRes _res;

  call({
    String? block,
    String? building,
    String? flat,
    String? floor,
    String? id,
    bool? isPrimary,
    String? name,
    String? street,
    String? way,
  }) =>
      _res;
}

class Input$SignUpInput {
  factory Input$SignUpInput({
    String? email,
    required String firstName,
    required String lastName,
    String? middleName,
    required String otpId,
    required String phone,
  }) =>
      Input$SignUpInput._({
        if (email != null) r'email': email,
        r'firstName': firstName,
        r'lastName': lastName,
        if (middleName != null) r'middleName': middleName,
        r'otpId': otpId,
        r'phone': phone,
      });

  Input$SignUpInput._(this._$data);

  factory Input$SignUpInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    final l$firstName = data['firstName'];
    result$data['firstName'] = (l$firstName as String);
    final l$lastName = data['lastName'];
    result$data['lastName'] = (l$lastName as String);
    if (data.containsKey('middleName')) {
      final l$middleName = data['middleName'];
      result$data['middleName'] = (l$middleName as String?);
    }
    final l$otpId = data['otpId'];
    result$data['otpId'] = (l$otpId as String);
    final l$phone = data['phone'];
    result$data['phone'] = (l$phone as String);
    return Input$SignUpInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get email => (_$data['email'] as String?);

  String get firstName => (_$data['firstName'] as String);

  String get lastName => (_$data['lastName'] as String);

  String? get middleName => (_$data['middleName'] as String?);

  String get otpId => (_$data['otpId'] as String);

  String get phone => (_$data['phone'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    final l$firstName = firstName;
    result$data['firstName'] = l$firstName;
    final l$lastName = lastName;
    result$data['lastName'] = l$lastName;
    if (_$data.containsKey('middleName')) {
      final l$middleName = middleName;
      result$data['middleName'] = l$middleName;
    }
    final l$otpId = otpId;
    result$data['otpId'] = l$otpId;
    final l$phone = phone;
    result$data['phone'] = l$phone;
    return result$data;
  }

  CopyWith$Input$SignUpInput<Input$SignUpInput> get copyWith =>
      CopyWith$Input$SignUpInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$SignUpInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$middleName = middleName;
    final lOther$middleName = other.middleName;
    if (_$data.containsKey('middleName') !=
        other._$data.containsKey('middleName')) {
      return false;
    }
    if (l$middleName != lOther$middleName) {
      return false;
    }
    final l$otpId = otpId;
    final lOther$otpId = other.otpId;
    if (l$otpId != lOther$otpId) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$middleName = middleName;
    final l$otpId = otpId;
    final l$phone = phone;
    return Object.hashAll([
      _$data.containsKey('email') ? l$email : const {},
      l$firstName,
      l$lastName,
      _$data.containsKey('middleName') ? l$middleName : const {},
      l$otpId,
      l$phone,
    ]);
  }
}

abstract class CopyWith$Input$SignUpInput<TRes> {
  factory CopyWith$Input$SignUpInput(
    Input$SignUpInput instance,
    TRes Function(Input$SignUpInput) then,
  ) = _CopyWithImpl$Input$SignUpInput;

  factory CopyWith$Input$SignUpInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SignUpInput;

  TRes call({
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
    String? otpId,
    String? phone,
  });
}

class _CopyWithImpl$Input$SignUpInput<TRes>
    implements CopyWith$Input$SignUpInput<TRes> {
  _CopyWithImpl$Input$SignUpInput(
    this._instance,
    this._then,
  );

  final Input$SignUpInput _instance;

  final TRes Function(Input$SignUpInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? middleName = _undefined,
    Object? otpId = _undefined,
    Object? phone = _undefined,
  }) =>
      _then(Input$SignUpInput._({
        ..._instance._$data,
        if (email != _undefined) 'email': (email as String?),
        if (firstName != _undefined && firstName != null)
          'firstName': (firstName as String),
        if (lastName != _undefined && lastName != null)
          'lastName': (lastName as String),
        if (middleName != _undefined) 'middleName': (middleName as String?),
        if (otpId != _undefined && otpId != null) 'otpId': (otpId as String),
        if (phone != _undefined && phone != null) 'phone': (phone as String),
      }));
}

class _CopyWithStubImpl$Input$SignUpInput<TRes>
    implements CopyWith$Input$SignUpInput<TRes> {
  _CopyWithStubImpl$Input$SignUpInput(this._res);

  TRes _res;

  call({
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
    String? otpId,
    String? phone,
  }) =>
      _res;
}

enum Enum$PushNotificationType {
  HOME_STOP_TRACKING,
  OTHERS,
  PAYMENT_REMINDER,
  SCHOOL_STOP_TRACKING,
  STUDENT_VEHICLE_TRACKING,
  $unknown
}

String toJson$Enum$PushNotificationType(Enum$PushNotificationType e) {
  switch (e) {
    case Enum$PushNotificationType.HOME_STOP_TRACKING:
      return r'HOME_STOP_TRACKING';
    case Enum$PushNotificationType.OTHERS:
      return r'OTHERS';
    case Enum$PushNotificationType.PAYMENT_REMINDER:
      return r'PAYMENT_REMINDER';
    case Enum$PushNotificationType.SCHOOL_STOP_TRACKING:
      return r'SCHOOL_STOP_TRACKING';
    case Enum$PushNotificationType.STUDENT_VEHICLE_TRACKING:
      return r'STUDENT_VEHICLE_TRACKING';
    case Enum$PushNotificationType.$unknown:
      return r'$unknown';
  }
}

Enum$PushNotificationType fromJson$Enum$PushNotificationType(String value) {
  switch (value) {
    case r'HOME_STOP_TRACKING':
      return Enum$PushNotificationType.HOME_STOP_TRACKING;
    case r'OTHERS':
      return Enum$PushNotificationType.OTHERS;
    case r'PAYMENT_REMINDER':
      return Enum$PushNotificationType.PAYMENT_REMINDER;
    case r'SCHOOL_STOP_TRACKING':
      return Enum$PushNotificationType.SCHOOL_STOP_TRACKING;
    case r'STUDENT_VEHICLE_TRACKING':
      return Enum$PushNotificationType.STUDENT_VEHICLE_TRACKING;
    default:
      return Enum$PushNotificationType.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
