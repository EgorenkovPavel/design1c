import 'package:design1c/data/elements/data_checkbox.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class UICheckbox extends UIElement<DataCheckbox> {
  const UICheckbox(
      {Key? key, required DataCheckbox data, required bool isActive})
      : super(key: key, data: data, isActive: isActive);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimens.widthBetweenElements),
        height: Dimens.minRowHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
            const SizedBox(
              width: Dimens.widthBetweenElements,
            ),
            Text(
              data.title,
              style: TextStyles.textTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
