import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/ui/edit_panel.dart';
import 'package:flutter/material.dart';

class FieldPanel extends EditPanel<DataField> {
  const FieldPanel({Key? key,
    required DataField data,
    required void Function(DataField newData) onUpdate,
  }) : super(key: key,
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
              controller: TextEditingController(text: data.hint),
              onSubmitted: (value) {
                onUpdate(data.copyWith(hint: value));
              },
            ),
          ),
        ],
      ),
    );
  }
}
