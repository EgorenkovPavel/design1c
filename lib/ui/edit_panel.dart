import 'package:design1c/data/data_element.dart';
import 'package:design1c/data/elements/data_button.dart';
import 'package:design1c/data/elements/data_field.dart';
import 'package:design1c/data/elements/data_text.dart';
import 'package:design1c/ui/edit_panels/button_panel.dart';
import 'package:flutter/material.dart';

import 'edit_panels/field_panel.dart';
import 'edit_panels/text_panel.dart';

abstract class EditPanel<T extends DataElement> extends StatelessWidget {
  final T data;
  final void Function(T newData) onUpdate;

  const EditPanel({
    Key? key,
    required this.data,
    required this.onUpdate,
  }) : super(key: key);


  static Widget fromData(DataElement data, void Function(DataElement newData) onUpdate){
    if (data is DataButton){
      return ButtonPanel(data: data, onUpdate: onUpdate);
    }else if (data is DataText){
      return TextPanel(data: data, onUpdate: onUpdate);
    }else if (data is DataField){
      return FieldPanel(data: data, onUpdate: onUpdate,);
    }
    return const SizedBox();
  }

}
