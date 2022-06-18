import 'package:design1c/data/data_element.dart';
import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/data/elements/data_checkbox.dart';
import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/elements/ui_button.dart';
import 'package:design1c/ui/elements/ui_checkbox.dart';
import 'package:design1c/ui/elements/ui_field.dart';
import 'package:design1c/ui/elements/ui_text.dart';
import 'package:flutter/material.dart';

abstract class UIElement<T extends DataElement> extends StatelessWidget {
  final T data;
  final bool isActive;

  const UIElement({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  static Widget fromData({
    required DataElement data,
    required bool isActive,
   void Function(DataElement newData)? onUpdate,
}) {
    if (data is DataButton) {
      return UIButton(data: data, isActive: isActive);
    } else if (data is DataText) {
      return UIText(data: data, isActive: isActive, onUpdate: onUpdate);
    } else if (data is DataField) {
      return UIField(data: data, isActive: isActive, onUpdate: onUpdate);
    } else if (data is DataCheckbox){
      return UICheckbox(data: data, isActive: isActive);
    }
    return const SizedBox();
  }

  static Widget getFormWidget({
    required DataElement data,
    required bool isActive,
    required void Function() onDoubleTap,
    required void Function() onReplace,
    required void Function(DataElement newData) onUpdate,
  }) {
    if (isActive) {
      return UIElement.fromData(data: data, isActive: isActive, onUpdate: onUpdate);
    } else {
      return GestureDetector(
        onDoubleTap: onDoubleTap,
        child: Draggable<DataElement>(
          data: data,
          feedback: UIElement.fromData(data: data, isActive: false),
          childWhenDragging: UIElement.fromData(data: data, isActive: false),
          onDragCompleted: onReplace,
          child: UIElement.fromData(data: data, isActive: isActive),
        ),
      );
    }
  }
}
