import 'package:design1c/data/data_element.dart';
import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/data/elements/data_checkbox.dart';
import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/data/elements/data_hyperlink.dart';
import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/elements/ui_button.dart';
import 'package:design1c/ui/elements/ui_checkbox.dart';
import 'package:design1c/ui/elements/ui_field.dart';
import 'package:design1c/ui/elements/ui_hyperlink.dart';
import 'package:design1c/ui/elements/ui_text.dart';
import 'package:flutter/material.dart';

import '../data/elements/data_table.dart';
import 'elements/ui_table.dart';

class UIElement{

  static Widget fromDataForCommon({
    required DataElement data,
    required bool isActive,
}) {
    if (data is DataButton) {
      return UIButton(data: data, isActive: false);
    } else if (data is DataText) {
      return UIText(data: data, isActive: false);
    } else if (data is DataField) {
      return UIField(data: data, isActive: false);
    } else if (data is DataCheckbox){
      return UICheckbox(data: data, isActive: false);
    } else if (data is DataHyperlink){
      return UIHyperlink(data: data, isActive: false);
    } else if (data is DataFormTable) {
      return UITableCommon(data: data, isActive: false);
    }
    return const SizedBox();
  }

  static Widget fromDataForForm({
    required DataElement data,
    required bool isActive,
  }) {
    if (data is DataButton) {
      return UIButton(data: data, isActive: isActive);
    } else if (data is DataText) {
      return UIText(data: data, isActive: isActive);//, onUpdate: onUpdate);
    } else if (data is DataField) {
      return UIField(data: data, isActive: isActive);
    } else if (data is DataCheckbox){
      return UICheckbox(data: data, isActive: isActive);
    } else if (data is DataHyperlink){
      return UIHyperlink(data: data, isActive: isActive);
    } else if (data is DataFormTable) {
      return UIFormTable(data: data, isActive: isActive);
    }
    return const SizedBox();
  }
}
