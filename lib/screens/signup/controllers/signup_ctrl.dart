

import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/api/main_app_schema/signup/signup.graphql.dart';
import 'package:flutter_hooks_sample/screens/signup/model/signup_input.dart';
import 'package:flutter_hooks_sample/utils/graphql.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';

typedef SignUpSponsor = Mutation$SignUpSponsor$signUpSponsor;

class SignUpCtrl {
  final firstNameCtrl = useTextEditingController();
  final middleNameCtrl = useTextEditingController();
  final lastNameCtrl = useTextEditingController();
  final countryCodeCtrl = useTextEditingController(text: '+968');
  final phoneCtrl = useTextEditingController();
  final emailCtrl = useTextEditingController();

  final client = useGraphQLCustomClient('main');

  final firstNameValidator =
  useState(FormBuilderValidators.compose([FormBuilderValidators.max(100)]));

  final middleNameValidator = useState(FormBuilderValidators.compose([
    FormBuilderValidators.maxLength(100),
  ]));

  final lastNameValidator =
  useState(FormBuilderValidators.compose([FormBuilderValidators.max(100)]));

  final phoneValidator = useState(
      FormBuilderValidators.compose([FormBuilderValidators.numeric()]));

  final emailValidator = useState(FormBuilderValidators.compose([
    FormBuilderValidators.email(),
    FormBuilderValidators.maxLength(100),
  ]));


  Future<String? Function(String?)> isPhoneNewValidator(String phone) async {
    //TODO: do validation or call API
    return  (_) => 'Phone already exists';
  }

  Future<String? Function(Object?)> lengthValidator(String firstName) async {
    if (firstName.length > 100) {
      return (_) =>
          'maximum_text_allowed'.tr(); //"Maximum of 100 characters allowed.";
    } else {
      return (_) => null;
    }
  }

  Future<String? Function(Object?)> stringContainsDigits(
      String firstName) async {
    if (firstName.contains(RegExp('[0-9]'))) {
      return (_) => 'validate_text_no_numbers'.tr();
    } else {
      return (_) => null;
    }
  }

  Future<String? Function(Object?)> stringContainsCharacters(
      String firstName) async {
    if (firstName.contains(RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
    "'"
        ']'))) {
      return (_) => 'validate_text_no_symbols'.tr();
    } else {
      return (_) => null;
    }
  }

  Future updateValidators(SignUpInput input) async {
    final phoneValidator = input.phone.length > 4
        ? await isPhoneNewValidator(input.phone)
        : (_) => '';
    this.phoneValidator.value = FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: 'empty_phone_validation'.tr()),
      FormBuilderValidators.maxLength(9, errorText: 'validate_phone'.tr()),
      FormBuilderValidators.minLength(6, errorText: 'validate_phone'.tr()),
      FormBuilderValidators.numeric(),
      phoneValidator,
    ]);
    final firstNameValidator = await lengthValidator(input.firstName);
    final firstNumberValidator = await stringContainsDigits(input.firstName);
    final firstCharacterValidation =
    await stringContainsCharacters(input.firstName);
    this.firstNameValidator.value = FormBuilderValidators.compose([
      FormBuilderValidators.required(
          errorText: 'validate_empty_first_name'.tr()),
      FormBuilderValidators.minLength(2,
          errorText: 'validate_char_number_first_name'.tr()),
      firstNameValidator,
      firstNumberValidator,
      firstCharacterValidation
    ]);
    final lastNameValidator = await lengthValidator(input.lastName);
    final lastNumberValidator = await stringContainsDigits(input.lastName);
    final lastCharacterValidation =
    await stringContainsCharacters(input.lastName);

    final firstAndLastSameLanguageValidator =

    this.lastNameValidator.value = FormBuilderValidators.compose([
      FormBuilderValidators.required(
          errorText: 'validate_empty_last_name'.tr()),
      FormBuilderValidators.minLength(2,
          errorText: 'validate_char_number_last_name'.tr()),
      lastNameValidator,
      lastNumberValidator,
      lastCharacterValidation,
    ]);
  }

  String intToTimeLeft(int value) {
    int h, m, s;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (m * 60);
    return "$m:$s";
  }
}
