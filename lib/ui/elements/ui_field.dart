import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/ui/resize_marker.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class UIField extends StatelessWidget {
  final DataField data;
  final bool isActive;
  final void Function(DataField newData)? onUpdate;

  const UIField({
    Key? key,
    required this.data,
    required this.isActive,
    this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          height: Dimens.textFieldHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            border: Border.all(
                color: FormColors.textFieldBorderColor,
                width: isActive ? 2 : 1),
          ),
          width: data.width,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data.hint,
                style: TextStyles.textFieldTextStyle,
              )),
        ),
        if (isActive)
          ResizeMarker(
              parentWidth: data.width,
              parentHeight: Dimens.minRowHeight,
              onUpdate: (newWidth) {
                if (onUpdate != null) {
                  onUpdate!(data.copyWith(width: newWidth));
                }
              })
      ],
    );
  }
}
