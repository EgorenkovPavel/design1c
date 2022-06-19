import 'package:design1c/data/elements/data_checkbox.dart';
import 'package:design1c/ui/active_element_border.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class UICheckbox extends StatelessWidget {
  final DataCheckbox data;
  final bool isActive;

  UICheckbox({Key? key, required this.data, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.widthBetweenElements),
          height: Dimens.minRowHeight,
          child: Center(
            child: Container(
              width: Dimens.checkboxSize,
              height: Dimens.checkboxSize,
              decoration: BoxDecoration(
                border: Border.all(
                    color: FormColors.checkboxBorderColor,
                    width: Dimens.checkboxBorderWidth),
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimens.checkboxBorderRadius)),
              ),
            ),
          ),
        ),
        if (isActive)
          ActiveElementBorder(
              width: Dimens.widthBetweenElements * 2 + Dimens.checkboxSize,
              height: Dimens.minRowHeight,
              horizontalResizeAvailable: false, verticalResizeAvailable: false),
      ],
    );
  }
}
