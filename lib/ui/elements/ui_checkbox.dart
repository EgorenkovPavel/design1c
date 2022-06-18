import 'package:design1c/data/elements/data_checkbox.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class UICheckbox extends UIElement<DataCheckbox> {
  const UICheckbox({Key? key, required DataCheckbox data, required bool isActive})
      : super(key: key, data: data, isActive: isActive);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (_) {}),
          const SizedBox(
            width: Dimens.widthBeetwinElements,
          ),
          Text(data.title),
        ],
      ),
    );
  }
}
