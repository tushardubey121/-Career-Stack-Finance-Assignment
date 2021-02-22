import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stack_fincer_assignment/pages/custom_widgets/tap_widget.dart';
import 'package:stack_fincer_assignment/utils/resource/color_constant.dart';
import 'package:stack_fincer_assignment/utils/resource/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function onClick;
  final Color color;

  CustomButton({
    @required this.text,
    this.color,
    this.textStyle,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TapWidget(
      onTap: () {
        if (onClick != null) {
          onClick();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: color ?? ColorConstant.PRIMARY,
        ),
        alignment: Alignment.center,
        child: Text(
          text ?? "",
          style: textStyle ?? Styles.extraBoldWhite(size: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
