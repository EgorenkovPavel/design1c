import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/resize_marker.dart';
import 'package:design1c/utils/values.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:flutter/material.dart';

class UIText extends UIElement<DataText> {

  final void Function(DataText newData)? onUpdate;

  const UIText({
    Key? key,
    required DataText data,
    required bool isActive,
    required this.onUpdate,
  }) : super(
    key: key,
          data: data,
          isActive: isActive,
        );

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Stack(
        children: [
          Container(
            width: data.width,
            padding: const EdgeInsets.all(4.0),
            height: Dimens.minRowHeigth,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(2.0)),
              border: Border.all(color: Colors.black, width: isActive ? 2 : 0),
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data.text,
                  style: const TextStyle(fontSize: 12),
                )),
          ),
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
    }else{
      return Container(
        width: data.width,
        padding: const EdgeInsets.all(4.0),
        height: Dimens.minRowHeigth,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data.text,
              style: const TextStyle(fontSize: 12),
            )),
      );
    }
  }
}
