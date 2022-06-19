import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class UIButton extends StatelessWidget {

  final DataButton data;
  final bool isActive;

  const UIButton({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.buttonBorderPadding),
      height: Dimens.buttonHeight,
      decoration: BoxDecoration(
        //color: data.backgroundColor,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              data.backgroundColor.withOpacity(0.2),
              data.backgroundColor
            ]),
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.buttonBorderRadius)),
        border: Border.all(color: FormColors.buttonBorderColor, width: isActive ? 2 : Dimens.buttonBorderWidth),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.buttonTextHorizontalPadding),
        child: Text(
          data.title,
          style: data.textStyle,
        ),
      )),
    );
  }
}
