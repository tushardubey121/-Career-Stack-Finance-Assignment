import 'package:flutter/material.dart';

import 'color_constant.dart';

class Styles {
  static boldBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: ColorConstant.BLACK,
    );
  }

  static boldBlueAccent({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.blueAccent,
    );
  }

  static boldWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w900,
      color: ColorConstant.WHITE,
    );
  }

  static boldGrey({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.GRAY,
    );
  }

  static themeBold({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.PRIMARY,
    );
  }

  static themeExtraBold({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.PRIMARY,
    );
  }

  static boldHintGrey({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w900,
      color: ColorConstant.HINT_GRAY,
    );
  }

  static extraBoldHintGrey({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.HINT_GRAY,
    );
  }

  static extraBoldBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.BLACK,
    );
  }

  static extraBoldBlackShadow({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.BLACK,
    );
  }

  static extraBoldWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.WHITE,
    );
  }

  static mediumBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.BLACK,
    );
  }

  static regularBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.BLACK,
    );
  }

  static regularWhite({double size = 14}) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: ColorConstant.WHITE,
    );
  }

  static regularGray({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.GRAY,
    );
  }

  static regularPrimary({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.PRIMARY,
    );
  }

  static regularHintGray({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.HINT_GRAY,
    );
  }

  static semiBoldBlack({double size = 14}) {
    return TextStyle(
      fontSize: size,
      color: ColorConstant.BLACK,
    );
  }
}
