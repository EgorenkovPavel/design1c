import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/ui/resize_marker.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class UIField extends UIElement<DataField> {
  final void Function(DataField newData)? onUpdate;

  const UIField({
    Key? key,
    required DataField data,
    required bool isActive,
    this.onUpdate,
  }) : super(
          key: key,
          data: data,
          isActive: isActive,
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          height: Dimens.minRowHeigth,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            border: Border.all(color: Colors.black, width: isActive ? 2 : 1),
          ),
          width: data.width,
          child: Center(
              child: Text(
            data.hint,
            style: const TextStyle(fontSize: 12),
          )),
        ),
        if (isActive)
          ResizeMarker(
              parentWidth: data.width,
              parentHeight: Dimens.minRowHeigth,
              onUpdate: (newWidth) {
                if (onUpdate != null) {
                  onUpdate!(data.copyWith(width: newWidth));
                }
              })
      ],
    );
  }
}
