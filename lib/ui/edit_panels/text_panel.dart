import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/edit_panel.dart';
import 'package:flutter/material.dart';

class TextPanel extends EditPanel<DataText> {
  const TextPanel({
    Key? key,
    required DataText data,
    required void Function(DataText newData) onUpdate,
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
            width: 500,
            child: TextField(
              controller: TextEditingController(text: data.text),
              onSubmitted: (value) {
                onUpdate(data.copyWith(text: value));
              },
            ),
          ),
        ],
      ),
    );
  }
}
