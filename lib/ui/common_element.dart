import 'package:design1c/data/data_element.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:flutter/material.dart';

class CommonElement extends StatelessWidget {
  final DataElement data;

  const CommonElement({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = UIElement.fromData(data: data, isActive: false);
    return Draggable<DataElement>(
      data: data,
      feedback: child,
      child: child,
      childWhenDragging: child,
    );
  }
}
