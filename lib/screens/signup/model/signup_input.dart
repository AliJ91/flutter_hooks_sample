

import 'package:flutter_hooks_sample/api/main_app_schema/main_app_schema.graphql.dart';

typedef SignUpInput = Input$SignUpInput;


SignUpInput createNewSignUpInput() {
  return SignUpInput(
    firstName: '',
    middleName: null,
    lastName: '',
    email: null,
    phone: '',
    otpId: '',
  );
}

