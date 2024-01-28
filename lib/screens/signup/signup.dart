// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/screens/signup/controllers/signup_ctrl.dart';
import 'package:flutter_hooks_sample/screens/signup/model/signup_input.dart';
import 'package:flutter_hooks_sample/screens/signup/stores/use_signup_input.dart';
import 'package:flutter_hooks_sample/styles/colors.dart';
import 'package:flutter_hooks_sample/styles/text_style_config.dart';
import 'package:flutter_hooks_sample/utils/graphql.dart';
import 'package:flutter_hooks_sample/widgets/button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends HookWidget {
  SignupScreen({Key? key}) : super(key: key);

  static const routeName = '/signup';
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode phoneNumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(GlobalKey<FormState>.new, const []);
    final spacing = MediaQuery.of(context).size.height * 0.03;
    final SignUpCtrl signUpCtrl = SignUpCtrl();
    final isSignupSelected = useState(false);
    final signUpInputNotifier = useSignUpInputNotifier();



    final isSubmitting = useState(false);
    final isCheckboxSelected = useState(true);
    final maxAttemptError = useState(false);
    final client = useGraphQLCustomClient('main');

    final deviceVersion = useState('');
    final deviceModel = useState('');



    final showLoader = useState(true);



    firstNameFocus.addListener(() async {
      if (!firstNameFocus.hasFocus) {
        await signUpCtrl.updateValidators(
            signUpInputNotifier.value ?? createNewSignUpInput());
        if (isSubmitting.value == true ||
            (signUpInputNotifier.value?.firstName != "" &&
                (signUpInputNotifier.value?.firstName.length ?? 0) > 1)) {
          _formKey.currentState?.validate();
        }
      } else {
        lastNameFocus.unfocus();
        phoneNumberFocus.unfocus();
      }
    });

    lastNameFocus.addListener(() async {
      if (!lastNameFocus.hasFocus) {
        await signUpCtrl.updateValidators(
            signUpInputNotifier.value ?? createNewSignUpInput());
        if (isSubmitting.value == true ||
            (signUpInputNotifier.value?.lastName != "" &&
                (signUpInputNotifier.value?.lastName.length ?? 0) > 1)) {
          _formKey.currentState?.validate();
        }
      } else {
        firstNameFocus.unfocus();
        phoneNumberFocus.unfocus();
      }
    });

    phoneNumberFocus.addListener(() async {
      await signUpCtrl.updateValidators(
          signUpInputNotifier.value ?? createNewSignUpInput());
      if (isSubmitting.value == true ||
          ((signUpInputNotifier.value?.phone.length ?? 0) > 9)) {
        _formKey.currentState?.validate();
      }
      //_formKey.currentState?.validate();
    });

    final secondsLeft = useState(0);
    final String maxAttemptsErrorMsg = useMemoized(() {
      if (secondsLeft.value < 1) {
        maxAttemptError.value = false;
      } else if (secondsLeft.value > 0) {
        return 'attempt_exceed'.tr(namedArgs: {
          "minutes": signUpCtrl.intToTimeLeft(secondsLeft.value)
        });
      }
      return '';
    }, [secondsLeft.value]);

    updateSignupNotifierOnSubmission() async {
     //TODO: add the logic you want here
      await signUpCtrl.updateValidators(
          signUpInputNotifier.value ?? createNewSignUpInput());
    }



    void onSubmissionTap() async {
      if (isCheckboxSelected.value) {
        isSubmitting.value = true;
        await updateSignupNotifierOnSubmission();

        Future.delayed(const Duration(milliseconds: 100), () async {
          final isValid = _formKey.currentState?.validate();
          isSubmitting.value = false;
          if (isValid == true) {
            maxAttemptError.value = false;
            _formKey.currentState?.save();

          }
        });
      } else {
        isSignupSelected.value = true;
      }
    }



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.near_me),//TODO: add your icon here
            onPressed: () {
             // TODO: Add navigation
            },
          ),
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ModalProgressHUD(
              inAsyncCall: showLoader.value,
              progressIndicator: Container(), //replace with loading widget
              child: Column(
                children: [
                  Expanded(
                      child: Stack(children: [

                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: _formKey,
                                    child: ValueListenableBuilder<SignUpInput?>(
                                        valueListenable: signUpInputNotifier,
                                        builder: (BuildContext context,
                                            SignUpInput? value, Widget? child) {
                                          final screenElementKeys = value?.toJson();
                                          final ctrls = {};
                                          screenElementKeys?.forEach((key, value) {
                                            if (key == 'phone') {
                                              final phone = "";
                                              ctrls[key] = TextEditingController(
                                                  text: phone);
                                              ctrls[key].selection =
                                                  TextSelection.fromPosition(
                                                      TextPosition(
                                                          offset: phone
                                                              .toString()
                                                              .length));
                                            } else {
                                              ctrls[key] = TextEditingController(
                                                  text: value.toString());
                                              ctrls[key].selection =
                                                  TextSelection.fromPosition(
                                                      TextPosition(
                                                          offset: value
                                                              .toString()
                                                              .length));
                                            }
                                          });
                                          return Column(
                                            children: [
                                              Container(
                                                  child: Text(
                                                    'sign_up',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                        color: AppColors
                                                            .primaryDarkText,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 20),
                                                  ).tr()), //textTheme.headline6
                                              SizedBox(
                                                height: spacing / 4,
                                              ),
                                              maxAttemptError.value == false
                                                  ? Text(
                                                'create_account_note',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ).tr()
                                                  : Text(maxAttemptsErrorMsg,
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                      height: 1.4,
                                                      color:
                                                      AppColors.error)),
                                              // first name outlined text field
                                              SizedBox(
                                                height: spacing * 1.5,
                                              ),
                                              TextFormField(
                                                  focusNode: firstNameFocus,
                                                  controller: ctrls['firstName'],
                                                  onChanged: (value) {
                                                    signUpInputNotifier.value =
                                                        signUpInputNotifier.value
                                                            ?.copyWith(
                                                            firstName: value);
                                                  },
                                                  validator: (isSubmitting.value ==
                                                      true ||
                                                      signUpInputNotifier.value
                                                          ?.firstName !=
                                                          "" ||
                                                      (signUpInputNotifier
                                                          .value
                                                          ?.firstName
                                                          .length ??
                                                          0) >
                                                          1)
                                                      ? signUpCtrl
                                                      .firstNameValidator.value
                                                      : null,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                      'first_name'.tr())),
                                              // last name outlined text field
                                              SizedBox(
                                                height: spacing,
                                              ),
                                              TextFormField(
                                                  controller: ctrls['middleName'],
                                                  onChanged: (value) {
                                                    signUpInputNotifier.value =
                                                        signUpInputNotifier.value
                                                            ?.copyWith(
                                                            middleName: value);
                                                  },
                                                  validator: signUpCtrl
                                                      .middleNameValidator.value,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                      'middle_name'.tr())),
                                              SizedBox(
                                                height: spacing,
                                              ),
                                              TextFormField(
                                                focusNode: lastNameFocus,
                                                controller: ctrls['lastName'],
                                                onChanged: (value) {
                                                  signUpInputNotifier.value =
                                                      signUpInputNotifier.value
                                                          ?.copyWith(
                                                          lastName: value);
                                                },
                                                validator:
                                                (isSubmitting.value == true ||
                                                    signUpInputNotifier
                                                        .value
                                                        ?.lastName !=
                                                        "" ||
                                                    (signUpInputNotifier
                                                        .value
                                                        ?.lastName
                                                        .length ??
                                                        0) >
                                                        1)
                                                    ? signUpCtrl
                                                    .lastNameValidator.value
                                                    : null,
                                                decoration: InputDecoration(
                                                    labelText: 'last_name'.tr()),
                                              ),
                                              // country code dropdown with flag. Oman and Kuwait

                                              // country code dropdown with flag. Oman and Kuwait
                                              SizedBox(
                                                height: spacing,
                                              ),
                                              Row(
                                                textDirection: TextDirection.ltr,
                                                // row containing country code and phone number
                                                // country code dropdown should be as small as possible
                                                // phone number should take up the rest of the space
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: spacing,
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: TextFormField(
                                                      focusNode: phoneNumberFocus,
                                                      controller: ctrls['phone'],
                                                      onChanged: (value) async {
                                                        maxAttemptError.value =
                                                        false;
                                                        isSubmitting.value = false;
                                                        signUpInputNotifier.value =
                                                            signUpInputNotifier.value?.copyWith(
                                                                phone:  "");

                                                      },
                                                      validator: (isSubmitting
                                                          .value ==
                                                          true ||
                                                          (((signUpInputNotifier
                                                              .value
                                                              ?.phone
                                                              .length ??
                                                              0) >
                                                              9)))
                                                          ? signUpCtrl
                                                          .phoneValidator.value
                                                          : null,
                                                      decoration: InputDecoration(
                                                          labelText:
                                                          'phone_number'.tr()),
                                                      keyboardType:
                                                      TextInputType.phone,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: spacing,
                                              ),
                                              TextFormField(
                                                controller: ctrls['email'],
                                                onChanged: (value) {
                                                  signUpInputNotifier.value =
                                                      signUpInputNotifier.value
                                                          ?.copyWith(email: value);
                                                },
                                                validator:
                                                signUpCtrl.emailValidator.value,
                                                decoration: InputDecoration(
                                                    labelText: 'email'.tr()),
                                                keyboardType:
                                                TextInputType.emailAddress,
                                              ),
                                              // consent to terms and conditions here
                                              SizedBox(
                                                height: spacing,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Checkbox(
                                                        side: !isCheckboxSelected
                                                            .value
                                                            ? const BorderSide(
                                                          color:
                                                          AppColors.error,
                                                          width: 1.5,
                                                        )
                                                            : null,
                                                        value: isCheckboxSelected
                                                            .value,
                                                        onChanged: (value) {
                                                          isSignupSelected.value =
                                                          false;
                                                          isCheckboxSelected.value =
                                                              value ?? true;
                                                        },
                                                      ),
                                                      // clickable text to the terms and service screen. text is underlined
                                                      Expanded(
                                                        child: RichText(
                                                          text: TextSpan(
                                                            style: AppTextStyleConfig
                                                                .textStyleBlack14,
                                                            children: [
                                                              TextSpan(
                                                                  text: 'agreeThe'
                                                                      .tr(),
                                                                  style: Theme.of(
                                                                      context)
                                                                      .textTheme
                                                                      .bodyText1),
                                                              TextSpan(
                                                                text:
                                                                'terms_and_conditions'
                                                                    .tr(),
                                                                style: Theme.of(
                                                                    context)
                                                                    .textTheme
                                                                    .bodyText2!
                                                                    .copyWith(
                                                                    color: AppColors
                                                                        .primaryDark,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                                recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap = () {
                                                                   //TODO: open web view or whatever needed
                                                                  },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  isSignupSelected.value == false
                                                      ? Container()
                                                      : isCheckboxSelected.value ==
                                                      true
                                                      ? Container()
                                                      : Container(
                                                      child: Text(
                                                        'terms_validation'
                                                            .tr(),
                                                        style:
                                                        const TextStyle(
                                                          color: AppColors
                                                              .error,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              // signup button
                                              SizedBox(
                                                height: spacing,
                                              ),
                                              ButtonWidget(
                                                waitingAction: isSubmitting.value,
                                                onTap: () {
                                                  isSubmitting.value ||
                                                      maxAttemptError.value
                                                      ? null
                                                      : onSubmissionTap();
                                                },
                                                text: 'sign_up'.tr(),
                                              ),
                                              // Already have an account? Login here
                                              SizedBox(
                                                height: spacing,
                                              ),

                                              SizedBox(
                                                height: spacing,
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
                  //])
                ],
              ),
            )));
  }
}
