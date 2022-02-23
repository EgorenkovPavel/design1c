import 'package:design1c/data/data_element.dart';
import 'package:design1c/data/data_row.dart';
import 'package:design1c/ui/common_elements_panel.dart';
import 'package:design1c/ui/drag_target_zone.dart';
import 'package:design1c/ui/edit_panel.dart';
import 'package:design1c/ui/ui_element.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DataElementsRow> _rows = [];

  DataElement? activeElement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonElementsPanel(),
            const Spacer(),
            Container(
              width: 700,
              height: 500,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border.all(color: FormColors.formBorderColor),
                  color: FormColors.formBackgroungColor),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Реализация товаров услуг',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(child: makeFormBody()),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 300,
              child: activeElement == null
                  ? const SizedBox()
                  : EditPanel.fromData(
                      activeElement!, updateActiveElement),
            ),
          ],
        ),
      );
  }

  void updateActiveElement(DataElement newData) {
    setState(() {
      _rows
          .firstWhere((row) => row.elements.contains(activeElement))
          .replace(activeElement!, newData);
      activeElement = newData;
    });
  }

  Column makeFormBody() {
    List<Widget> children = [];
    for (var i = 0; i < _rows.length; i++) {
      var row = _rows[i];
      children.add(DragTargetZone.column(
        onAccept: (data) => setState(() {
          _rows.insert(i, DataElementsRow()..add(data));
        }),
        height: Dimens.heightBeetwinElements,
      ));
      children.add(makeRow(row));
    }

    children.add(DragTargetZone.column(
      onAccept: (data) => setState(() {
        _rows.add(DataElementsRow()..add(data));
      }),
      height: Dimens.heightBeetwinElements,
    ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Row makeRow(DataElementsRow row) {
    List<Widget> children = [];
    for (var i = 0; i < row.elements.length; i++) {
      var data = row.elements[i];
      children.add(
        DragTargetZone.row(
          onAccept: (value) => setState(() {
            row.insert(i, value.copy());
          }),
          width: Dimens.widthBeetwinElements,
        ),
      );
      children.add(UIElement.getFormWidget(
        data: data,
        isActive: data == activeElement,
        onDoubleTap: () => setState(() {
          activeElement = data;
        }),
        onReplace: () => setState(() {
          row.delete(data);
          if (row.elements.isEmpty) {
            _rows.removeWhere((element) => element.elements.isEmpty);
          }
        }),
        onUpdate: updateActiveElement,
      ));
    }

    children.add(Expanded(
      child: DragTargetZone.row(
        onAccept: (data) => setState(() {
          row.add(data);
        }),
      ),
    ));

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
