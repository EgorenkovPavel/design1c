import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/ui/color_chooser.dart';
import 'package:design1c/ui/edit_panel.dart';
import 'package:flutter/material.dart';

class ButtonPanel extends EditPanel<DataButton> {
  const ButtonPanel({
    Key? key,
    required DataButton data,
    required void Function(DataButton newData) onUpdate,
  }) : super(
          key: key,
          data: data,
          onUpdate: onUpdate,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              controller: TextEditingController(text: data.title),
              onSubmitted: (value) {
                onUpdate(data.copyWith(title: value));
              },
            ),
          ),
          InkWell(
            child: Container(
              color: data.backgroundColor,
              width: 20,
              height: 20,
            ),
            onTap: () async {
              final color = await chooseColor(context, data.backgroundColor);
              if (color != null) {
                onUpdate(data.copyWith(backgroundColor: color));
              }
            },
          ),
        ],
      ),
    );
  }
}
