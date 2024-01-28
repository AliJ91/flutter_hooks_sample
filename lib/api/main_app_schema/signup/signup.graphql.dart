import '../main_app_schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$SignUpSponsor {
  factory Variables$Mutation$SignUpSponsor(
          {required Input$SignUpInput sponsorInput}) =>
      Variables$Mutation$SignUpSponsor._({
        r'sponsorInput': sponsorInput,
      });

  Variables$Mutation$SignUpSponsor._(this._$data);

  factory Variables$Mutation$SignUpSponsor.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$sponsorInput = data['sponsorInput'];
    result$data['sponsorInput'] =
        Input$SignUpInput.fromJson((l$sponsorInput as Map<String, dynamic>));
    return Variables$Mutation$SignUpSponsor._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SignUpInput get sponsorInput =>
      (_$data['sponsorInput'] as Input$SignUpInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$sponsorInput = sponsorInput;
    result$data['sponsorInput'] = l$sponsorInput.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$SignUpSponsor<Variables$Mutation$SignUpSponsor>
      get copyWith => CopyWith$Variables$Mutation$SignUpSponsor(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SignUpSponsor) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$sponsorInput = sponsorInput;
    final lOther$sponsorInput = other.sponsorInput;
    if (l$sponsorInput != lOther$sponsorInput) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$sponsorInput = sponsorInput;
    return Object.hashAll([l$sponsorInput]);
  }
}

abstract class CopyWith$Variables$Mutation$SignUpSponsor<TRes> {
  factory CopyWith$Variables$Mutation$SignUpSponsor(
    Variables$Mutation$SignUpSponsor instance,
    TRes Function(Variables$Mutation$SignUpSponsor) then,
  ) = _CopyWithImpl$Variables$Mutation$SignUpSponsor;

  factory CopyWith$Variables$Mutation$SignUpSponsor.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SignUpSponsor;

  TRes call({Input$SignUpInput? sponsorInput});
}

class _CopyWithImpl$Variables$Mutation$SignUpSponsor<TRes>
    implements CopyWith$Variables$Mutation$SignUpSponsor<TRes> {
  _CopyWithImpl$Variables$Mutation$SignUpSponsor(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SignUpSponsor _instance;

  final TRes Function(Variables$Mutation$SignUpSponsor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? sponsorInput = _undefined}) =>
      _then(Variables$Mutation$SignUpSponsor._({
        ..._instance._$data,
        if (sponsorInput != _undefined && sponsorInput != null)
          'sponsorInput': (sponsorInput as Input$SignUpInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SignUpSponsor<TRes>
    implements CopyWith$Variables$Mutation$SignUpSponsor<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SignUpSponsor(this._res);

  TRes _res;

  call({Input$SignUpInput? sponsorInput}) => _res;
}

class Mutation$SignUpSponsor {
  Mutation$SignUpSponsor({
    required this.signUpSponsor,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SignUpSponsor.fromJson(Map<String, dynamic> json) {
    final l$signUpSponsor = json['signUpSponsor'];
    final l$$__typename = json['__typename'];
    return Mutation$SignUpSponsor(
      signUpSponsor: Mutation$SignUpSponsor$signUpSponsor.fromJson(
          (l$signUpSponsor as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SignUpSponsor$signUpSponsor signUpSponsor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signUpSponsor = signUpSponsor;
    _resultData['signUpSponsor'] = l$signUpSponsor.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signUpSponsor = signUpSponsor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$signUpSponsor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SignUpSponsor) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$signUpSponsor = signUpSponsor;
    final lOther$signUpSponsor = other.signUpSponsor;
    if (l$signUpSponsor != lOther$signUpSponsor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SignUpSponsor on Mutation$SignUpSponsor {
  CopyWith$Mutation$SignUpSponsor<Mutation$SignUpSponsor> get copyWith =>
      CopyWith$Mutation$SignUpSponsor(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SignUpSponsor<TRes> {
  factory CopyWith$Mutation$SignUpSponsor(
    Mutation$SignUpSponsor instance,
    TRes Function(Mutation$SignUpSponsor) then,
  ) = _CopyWithImpl$Mutation$SignUpSponsor;

  factory CopyWith$Mutation$SignUpSponsor.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignUpSponsor;

  TRes call({
    Mutation$SignUpSponsor$signUpSponsor? signUpSponsor,
    String? $__typename,
  });
  CopyWith$Mutation$SignUpSponsor$signUpSponsor<TRes> get signUpSponsor;
}

class _CopyWithImpl$Mutation$SignUpSponsor<TRes>
    implements CopyWith$Mutation$SignUpSponsor<TRes> {
  _CopyWithImpl$Mutation$SignUpSponsor(
    this._instance,
    this._then,
  );

  final Mutation$SignUpSponsor _instance;

  final TRes Function(Mutation$SignUpSponsor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? signUpSponsor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignUpSponsor(
        signUpSponsor: signUpSponsor == _undefined || signUpSponsor == null
            ? _instance.signUpSponsor
            : (signUpSponsor as Mutation$SignUpSponsor$signUpSponsor),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SignUpSponsor$signUpSponsor<TRes> get signUpSponsor {
    final local$signUpSponsor = _instance.signUpSponsor;
    return CopyWith$Mutation$SignUpSponsor$signUpSponsor(
        local$signUpSponsor, (e) => call(signUpSponsor: e));
  }
}

class _CopyWithStubImpl$Mutation$SignUpSponsor<TRes>
    implements CopyWith$Mutation$SignUpSponsor<TRes> {
  _CopyWithStubImpl$Mutation$SignUpSponsor(this._res);

  TRes _res;

  call({
    Mutation$SignUpSponsor$signUpSponsor? signUpSponsor,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SignUpSponsor$signUpSponsor<TRes> get signUpSponsor =>
      CopyWith$Mutation$SignUpSponsor$signUpSponsor.stub(_res);
}

const documentNodeMutationSignUpSponsor = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SignUpSponsor'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'sponsorInput')),
        type: NamedTypeNode(
          name: NameNode(value: 'SignUpInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'signUpSponsor'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'sponsorInput'),
            value: VariableNode(name: NameNode(value: 'sponsorInput')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'accessToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstNameAr'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'country'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastNameAr'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'middleName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'middleNameAr'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refreshToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'sponsorId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Mutation$SignUpSponsor$signUpSponsor {
  Mutation$SignUpSponsor$signUpSponsor({
    this.accessToken,
    this.firstName,
    this.firstNameAr,
    required this.country,
    this.email,
    this.lastName,
    this.lastNameAr,
    this.middleName,
    this.middleNameAr,
    this.phone,
    this.refreshToken,
    required this.sponsorId,
    required this.userId,
    this.$__typename = 'SignUpOutput',
  });

  factory Mutation$SignUpSponsor$signUpSponsor.fromJson(
      Map<String, dynamic> json) {
    final l$accessToken = json['accessToken'];
    final l$firstName = json['firstName'];
    final l$firstNameAr = json['firstNameAr'];
    final l$country = json['country'];
    final l$email = json['email'];
    final l$lastName = json['lastName'];
    final l$lastNameAr = json['lastNameAr'];
    final l$middleName = json['middleName'];
    final l$middleNameAr = json['middleNameAr'];
    final l$phone = json['phone'];
    final l$refreshToken = json['refreshToken'];
    final l$sponsorId = json['sponsorId'];
    final l$userId = json['userId'];
    final l$$__typename = json['__typename'];
    return Mutation$SignUpSponsor$signUpSponsor(
      accessToken: (l$accessToken as String?),
      firstName: (l$firstName as String?),
      firstNameAr: (l$firstNameAr as String?),
      country: (l$country as String),
      email: (l$email as String?),
      lastName: (l$lastName as String?),
      lastNameAr: (l$lastNameAr as String?),
      middleName: (l$middleName as String?),
      middleNameAr: (l$middleNameAr as String?),
      phone: (l$phone as String?),
      refreshToken: (l$refreshToken as String?),
      sponsorId: (l$sponsorId as String),
      userId: (l$userId as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String? accessToken;

  final String? firstName;

  final String? firstNameAr;

  final String country;

  final String? email;

  final String? lastName;

  final String? lastNameAr;

  final String? middleName;

  final String? middleNameAr;

  final String? phone;

  final String? refreshToken;

  final String sponsorId;

  final String userId;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$firstNameAr = firstNameAr;
    _resultData['firstNameAr'] = l$firstNameAr;
    final l$country = country;
    _resultData['country'] = l$country;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$lastNameAr = lastNameAr;
    _resultData['lastNameAr'] = l$lastNameAr;
    final l$middleName = middleName;
    _resultData['middleName'] = l$middleName;
    final l$middleNameAr = middleNameAr;
    _resultData['middleNameAr'] = l$middleNameAr;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$sponsorId = sponsorId;
    _resultData['sponsorId'] = l$sponsorId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accessToken = accessToken;
    final l$firstName = firstName;
    final l$firstNameAr = firstNameAr;
    final l$country = country;
    final l$email = email;
    final l$lastName = lastName;
    final l$lastNameAr = lastNameAr;
    final l$middleName = middleName;
    final l$middleNameAr = middleNameAr;
    final l$phone = phone;
    final l$refreshToken = refreshToken;
    final l$sponsorId = sponsorId;
    final l$userId = userId;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accessToken,
      l$firstName,
      l$firstNameAr,
      l$country,
      l$email,
      l$lastName,
      l$lastNameAr,
      l$middleName,
      l$middleNameAr,
      l$phone,
      l$refreshToken,
      l$sponsorId,
      l$userId,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SignUpSponsor$signUpSponsor) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessToken = accessToken;
    final lOther$accessToken = other.accessToken;
    if (l$accessToken != lOther$accessToken) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$firstNameAr = firstNameAr;
    final lOther$firstNameAr = other.firstNameAr;
    if (l$firstNameAr != lOther$firstNameAr) {
      return false;
    }
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$lastNameAr = lastNameAr;
    final lOther$lastNameAr = other.lastNameAr;
    if (l$lastNameAr != lOther$lastNameAr) {
      return false;
    }
    final l$middleName = middleName;
    final lOther$middleName = other.middleName;
    if (l$middleName != lOther$middleName) {
      return false;
    }
    final l$middleNameAr = middleNameAr;
    final lOther$middleNameAr = other.middleNameAr;
    if (l$middleNameAr != lOther$middleNameAr) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$sponsorId = sponsorId;
    final lOther$sponsorId = other.sponsorId;
    if (l$sponsorId != lOther$sponsorId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SignUpSponsor$signUpSponsor
    on Mutation$SignUpSponsor$signUpSponsor {
  CopyWith$Mutation$SignUpSponsor$signUpSponsor<
          Mutation$SignUpSponsor$signUpSponsor>
      get copyWith => CopyWith$Mutation$SignUpSponsor$signUpSponsor(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SignUpSponsor$signUpSponsor<TRes> {
  factory CopyWith$Mutation$SignUpSponsor$signUpSponsor(
    Mutation$SignUpSponsor$signUpSponsor instance,
    TRes Function(Mutation$SignUpSponsor$signUpSponsor) then,
  ) = _CopyWithImpl$Mutation$SignUpSponsor$signUpSponsor;

  factory CopyWith$Mutation$SignUpSponsor$signUpSponsor.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SignUpSponsor$signUpSponsor;

  TRes call({
    String? accessToken,
    String? firstName,
    String? firstNameAr,
    String? country,
    String? email,
    String? lastName,
    String? lastNameAr,
    String? middleName,
    String? middleNameAr,
    String? phone,
    String? refreshToken,
    String? sponsorId,
    String? userId,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SignUpSponsor$signUpSponsor<TRes>
    implements CopyWith$Mutation$SignUpSponsor$signUpSponsor<TRes> {
  _CopyWithImpl$Mutation$SignUpSponsor$signUpSponsor(
    this._instance,
    this._then,
  );

  final Mutation$SignUpSponsor$signUpSponsor _instance;

  final TRes Function(Mutation$SignUpSponsor$signUpSponsor) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessToken = _undefined,
    Object? firstName = _undefined,
    Object? firstNameAr = _undefined,
    Object? country = _undefined,
    Object? email = _undefined,
    Object? lastName = _undefined,
    Object? lastNameAr = _undefined,
    Object? middleName = _undefined,
    Object? middleNameAr = _undefined,
    Object? phone = _undefined,
    Object? refreshToken = _undefined,
    Object? sponsorId = _undefined,
    Object? userId = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SignUpSponsor$signUpSponsor(
        accessToken: accessToken == _undefined
            ? _instance.accessToken
            : (accessToken as String?),
        firstName: firstName == _undefined
            ? _instance.firstName
            : (firstName as String?),
        firstNameAr: firstNameAr == _undefined
            ? _instance.firstNameAr
            : (firstNameAr as String?),
        country: country == _undefined || country == null
            ? _instance.country
            : (country as String),
        email: email == _undefined ? _instance.email : (email as String?),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        lastNameAr: lastNameAr == _undefined
            ? _instance.lastNameAr
            : (lastNameAr as String?),
        middleName: middleName == _undefined
            ? _instance.middleName
            : (middleName as String?),
        middleNameAr: middleNameAr == _undefined
            ? _instance.middleNameAr
            : (middleNameAr as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        refreshToken: refreshToken == _undefined
            ? _instance.refreshToken
            : (refreshToken as String?),
        sponsorId: sponsorId == _undefined || sponsorId == null
            ? _instance.sponsorId
            : (sponsorId as String),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SignUpSponsor$signUpSponsor<TRes>
    implements CopyWith$Mutation$SignUpSponsor$signUpSponsor<TRes> {
  _CopyWithStubImpl$Mutation$SignUpSponsor$signUpSponsor(this._res);

  TRes _res;

  call({
    String? accessToken,
    String? firstName,
    String? firstNameAr,
    String? country,
    String? email,
    String? lastName,
    String? lastNameAr,
    String? middleName,
    String? middleNameAr,
    String? phone,
    String? refreshToken,
    String? sponsorId,
    String? userId,
    String? $__typename,
  }) =>
      _res;
}
