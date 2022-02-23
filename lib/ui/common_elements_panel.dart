import 'package:design1c/data/data_element.dart';
import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/data/elements/data_checkbox.dart';
import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/common_element.dart';
import 'package:flutter/material.dart';

class CommonElementsPanel extends StatelessWidget {
  final List<DataElement> commonElements = [
    DataButton(
        title: 'Провести и закрыть',
        backgroundColor: Colors.amber[300]!,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        )),
    DataButton(
        title: 'Печать',
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 12,
        )),
    DataText(text: 'Text', width: 100.0),
    DataField(hint: 'Поле ввода', width: 100.0),
    DataCheckbox(title: 'Переключатель'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:
            commonElements.map<Widget>((e) => CommonElement(data: e))
                .expand((element) => [SizedBox(height: 16.0), element])
                .toList(),
      ),
    );
  }
}
