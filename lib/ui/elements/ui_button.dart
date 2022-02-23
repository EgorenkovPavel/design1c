import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class UIButton extends UIElement<DataButton> {
  const UIButton({
    Key? key,
    required DataButton data,
    required bool isActive,
  }) : super(
    key: key,
          data: data,
          isActive: isActive,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      height: Dimens.minRowHeigth,
      decoration: BoxDecoration(
        //color: data.backgroundColor,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              data.backgroundColor.withOpacity(0.8),
              data.backgroundColor
            ]),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(color: Colors.black, width: isActive ? 2 : 1),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          data.title,
          style: data.textStyle,
        ),
      )),
    );
  }
}
