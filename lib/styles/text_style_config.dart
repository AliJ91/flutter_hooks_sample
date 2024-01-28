import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//to access the size of the screen directly without calling MediaQuery everyTime.
class AppTextStyleConfig {

//black textStyle
  static late TextStyle textStyleBlack20;
  static late TextStyle textStyleBlack18;
  static late TextStyle textStyleBlack16;
  static late TextStyle textStyleBlack14;
  static late TextStyle textStyleBlack12;

  //dark grey textStyle
  static late TextStyle textStyleDarkGrey20;
  static late TextStyle textStyleDarkGrey18;
  static late TextStyle textStyleDarkGrey16;
  static late TextStyle textStyleDarkGrey14;
  static late TextStyle textStyleDarkGrey12;

//grey textStyle
  static late TextStyle textStyleGrey20;
  static late TextStyle textStyleGrey18;
  static late TextStyle textStyleGrey16;
  static late TextStyle textStyleGrey14;
  static late TextStyle textStyleGrey12;

//light grey textStyle
  static late TextStyle textStyleLightGrey20;
  static late TextStyle textStyleLightGrey18;
  static late TextStyle textStyleLightGrey16;
  static late TextStyle textStyleLightGrey14;
  static late TextStyle textStyleLightGrey12;

//white textStyle
  static late TextStyle textStyleWhite20;
  static late TextStyle textStyleWhite18;
  static late TextStyle textStyleWhite16;
  static late TextStyle textStyleWhite14;
  static late TextStyle textStyleWhite12;

//PrimaryDark textStyle
  static late TextStyle textStylePrimaryDark20;
  static late TextStyle textStylePrimaryDark18;
  static late TextStyle textStylePrimaryDark16;
  static late TextStyle textStylePrimaryDark14;
  static late TextStyle textStylePrimaryDark12;

//PrimaryMedium textStyle
  static late TextStyle textStylePrimaryMedium20;
  static late TextStyle textStylePrimaryMedium18;
  static late TextStyle textStylePrimaryMedium16;
  static late TextStyle textStylePrimaryMedium14;
  static late TextStyle textStylePrimaryMedium12;

//PrimaryLight textStyle
  static late TextStyle textStyleSecondaryLightest20;
  static late TextStyle textStyleSecondaryLightest18;
  static late TextStyle textStyleSecondaryLightest16;
  static late TextStyle textStyleSecondaryLightest14;
  static late TextStyle textStyleSecondaryLightest12;

  static late TextStyle? activeTextStyle;
  static late TextStyle? inActiveTextStyle;
  static late TextStyle? smallButtonTextStyle;
  //MUST: be called at the first build method in the app to use it along the application
  //in our case in [MyApp]
  void init(BuildContext context) {
    activeTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.white,
        backgroundColor: AppColors.primaryDark,
        fontWeight: FontWeight.w400,
        fontFamily: "Asap",
        fontStyle: FontStyle.normal,
        fontSize: 12);


    inActiveTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: AppColors.primaryDark,
        fontWeight: FontWeight.w400,
        fontFamily: "Asap",
        fontStyle: FontStyle.normal,
        fontSize: 12);

    smallButtonTextStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Color(0xff475266),
        fontWeight: FontWeight.w700,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 14.2
    );


    //black textStyle
    textStyleBlack20= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.textBlack,fontSize: 20.sp);
    textStyleBlack18= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.textBlack,fontSize: 18.sp);
    textStyleBlack16= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.textBlack,fontSize: 16.sp);
    textStyleBlack14= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.textBlack,fontSize: 14.sp);
    textStyleBlack12= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.textBlack,fontSize: 12.sp);



//PrimaryDark textStyle
    textStylePrimaryDark20= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryDarkText,fontSize: 20.sp);
    textStylePrimaryDark18= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryDarkText,fontSize: 18.sp);
    textStylePrimaryDark16= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryDarkText,fontSize: 16.sp);
    textStylePrimaryDark14= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryDarkText,fontSize: 14.sp);
    textStylePrimaryDark12= Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primaryDarkText,fontSize: 12.sp);


  }
}
