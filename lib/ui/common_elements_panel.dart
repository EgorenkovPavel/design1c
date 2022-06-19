import 'package:design1c/data/data_element.dart';
import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/data/elements/data_checkbox.dart';
import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/data/elements/data_hyperlink.dart';
import 'package:design1c/data/elements/data_table.dart';
import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/common_element.dart';
import 'package:flutter/material.dart';

import '../utils/values.dart';

class CommonElementsPanel extends StatelessWidget {
  final List<DataElement> commonElements = [
    DataButton(
        title: 'Провести и закрыть',
        backgroundColor: FormColors.buttonAccentColor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: FontSizes.buttonFontSize,
        )),
    DataButton(
        title: 'Печать',
        backgroundColor: FormColors.buttonBackgroundColor,
        textStyle: const TextStyle(
          fontSize: FontSizes.buttonFontSize,
        )),
    DataText(text: 'Text', width: 100.0),
    DataHyperlink(text: 'Hyperlink', width: 100.0),
    DataField(hint: 'Поле ввода', width: 100.0),
    DataCheckbox(title: 'Переключатель'),
    DataFormTable(columns: ['Номенклатура', 'Количество', 'Цена','Сумма']),
  ];

  CommonElementsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
          commonElements.map<Widget>((e) => CommonElement(data: e))
              .expand((element) => [const SizedBox(height: 16.0), element])
              .toList(),
    );
  }
}
