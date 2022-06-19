import 'package:flutter/material.dart';

class Dimens {
  static const double minRowHeight = 26;
  static const double widthBetweenElements = 6.0;
  static const double heightBetweenElements = 6.0;

  static const double formTitlePadding = 9.0;

  static const double formTitleIconBorderRadius = 2;
  static const double formTitleIconBorderWidth = 1;

  static const double activeElementBorderWidth = 2;

  static const double textFieldHeight = 25;

  static const double buttonHeight = 26;
  static const double buttonBorderWidth = 1;
  static const double buttonBorderRadius = 2;
  static const double buttonTextHorizontalPadding = 6;
  static const double buttonBorderPadding = 6;

  static const double checkboxSize = 13;
  static const double checkboxBorderWidth = 1;
  static const double checkboxBorderRadius = 1.875;
}

class FormColors {
  static const Color formBackgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color formBorderColor = Color.fromRGBO(0, 0, 0, 0.4);
  static const Color formTitleTextColor = Color.fromARGB(255, 75, 75, 75);

  static const Color formTitleIconBorderColor = Color.fromRGBO(0, 0, 0, 0.3);

  static const Color textFieldBorderColor = Color.fromARGB(255, 160, 160, 160);
  static const Color textFieldTextColor = Color.fromARGB(255, 75, 75, 75);

  static const Color buttonAccentColor = Color.fromARGB(255, 255, 255, 0);
  static const Color buttonBackgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color buttonBorderColor = Color.fromRGBO(0, 0, 0, 0.4);

  static const Color textTextColor = Color.fromARGB(255, 75, 75, 75);

  static const Color checkboxBorderColor = Color.fromARGB(255, 160, 160, 160);

  static const Color hyperlinkTextColor = Color.fromRGBO(28, 85, 174, 1);

  static const Color activeElementBorderColor = Color.fromRGBO(250, 204, 31, 1);

}

class FontSizes {
  static const double formTitleFontSize = 18.6667;
  static const double textFieldFontSize = 10;
  static const double buttonFontSize = 13.3;
  static const double textFontSize = 13.3;
}

class TextStyles {
  static const TextStyle formTitleTextStyle = TextStyle(
      fontSize: FontSizes.formTitleFontSize,
      color: FormColors.formTitleTextColor,
      fontWeight: FontWeight.w400);

  static const TextStyle textFieldTextStyle = TextStyle(
      fontSize: FontSizes.textFieldFontSize,
      color: FormColors.textFieldTextColor);

  static const TextStyle textTextStyle = TextStyle(
    fontSize: FontSizes.textFontSize,
    color: FormColors.textTextColor,
  );

  static const TextStyle hyperlinkTextStyle = TextStyle(
      fontSize: FontSizes.textFontSize,
      color: FormColors.hyperlinkTextColor,
      decoration: TextDecoration.underline);
}
