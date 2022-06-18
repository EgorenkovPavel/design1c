import 'package:design1c/data/data_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataButton extends DataElement {
  final String title;
  final Color backgroundColor;
  final TextStyle textStyle;

  DataButton({
    String? id,
    required this.backgroundColor,
    required this.title,
    required this.textStyle,
  }) : super(id: id ?? DataElement.newId());

  DataButton copyWith({
    String? title,
    Color? backgroundColor,
    String? id,
    TextStyle? textStyle,
  }) =>
      DataButton(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        title: title ?? this.title,
        id: id ?? this.id,
        textStyle: textStyle ?? this.textStyle,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}
