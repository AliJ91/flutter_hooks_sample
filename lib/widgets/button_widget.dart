import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  final Color textColor;
  final Color btnColor;
  final Color borderColor;
  final double? width;
  final Widget? icon;
  final bool? waitingAction;
  final bool? disabled;
  final bool? isIconFirst;
  final double? padding;
  final double? contentVerticalPadding;
  final double? letterSpacing;

  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.letterSpacing,
    this.btnColor = Colors.green,
    this.textColor = Colors.lightGreen,
    this.borderColor = Colors.greenAccent,
    this.icon,
    this.padding,
    this.contentVerticalPadding,
    this.waitingAction,
    this.disabled,
    this.isIconFirst = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buttonContainer(context);
  }

  Widget _buttonContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 8),
      child: Container(
          width: width ?? 0.9.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                width: 1,
                color: disabled == true ? Colors.grey : borderColor),
            color: disabled == true ? Colors.grey : btnColor,
          ),
          child: _content(context)),
    );
  }

  _content(BuildContext context) {
    return InkWell(
      onTap: disabled == true || waitingAction == true ? null : onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIconFirst == true ? icon ?? Container() : Container(),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: contentVerticalPadding ?? 16, horizontal: 8),
            child: Center(
              child: Text(
                text.tr(),
                style: Theme.of(context).textTheme.button!.copyWith(
                    color: textColor,
                    fontSize: 14,
                    letterSpacing: letterSpacing ?? 0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          isIconFirst == false ? icon ?? Container() : Container(),
        ],
      ),
    );
  }
}
