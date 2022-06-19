import 'package:design1c/data/elements/data_hyperlink.dart';
import 'package:design1c/data/elements/data_table.dart';
import 'package:design1c/ui/elements/ui_hyperlink.dart';
import 'package:design1c/ui/elements/ui_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_element.dart';
import '../data/data_row.dart';
import '../data/elements/data_button.dart';
import '../data/elements/data_checkbox.dart';
import '../data/elements/data_field.dart';
import '../data/elements/data_text.dart';
import '../utils/values.dart';
import 'drag_target_zone.dart';
import 'elements/ui_button.dart';
import 'elements/ui_checkbox.dart';
import 'elements/ui_field.dart';
import 'elements/ui_text.dart';
import 'form_title.dart';
import 'home_bloc.dart';
import 'ui_element.dart';

class MainForm extends StatelessWidget {
  const MainForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      //height: 500,
      decoration: BoxDecoration(
          border: Border.all(color: FormColors.formBorderColor),
          color: FormColors.formBackgroundColor),
      child: makeFormBody(context, context.watch<HomeBloc>().state.rows),
    );
  }

  Column makeFormBody(BuildContext context, List<DataElementsRow> rows) {
    List<Widget> children = [const FormTitle()];
    for (var i = 0; i < rows.length; i++) {
      var row = rows[i];
      children.add(DragTargetZone.column(
        onAccept: (data) => context
            .read<HomeBloc>()
            .add(InsertInNewRow(rowIndex: i, element: data)),
        height: Dimens.heightBetweenElements,
      ));
      children.add(makeRow(context, row, i));
    }

    children.add(Expanded(
      child: DragTargetZone.column(
        onAccept: (data) => context.read<HomeBloc>().add(AddToLastRow(data)),
        height: Dimens.heightBetweenElements,
      ),
    ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget makeRow(BuildContext context, DataElementsRow row, int rowIndex) {
    if (row.elements.length == 1 && row.elements.first is DataFormTable) {
      final _data = row.elements.first;
      return UIElementWrapper(
        data: row.elements.first,
        isActive: context
            .select((HomeBloc bloc) => bloc.state.activeElement == _data),
        onTap: () => context.read<HomeBloc>().add(SetActiveElement(_data)),
        onReplace: () => context.read<HomeBloc>().add(DeleteElement(_data)),
      );
    }

    List<Widget> children = [];
    for (var i = 0; i < row.elements.length; i++) {
      var data = row.elements[i];
      children.add(
        DragTargetZone.row(
          onAccept: (data) => context.read<HomeBloc>().add(AddToRow(
              rowIndex: rowIndex, positionInRow: i, element: data.copy())),
          width: Dimens.widthBetweenElements,
        ),
      );
      children.add(UIElementWrapper(
        data: data,
        isActive:
            context.select((HomeBloc bloc) => bloc.state.activeElement == data),
        onTap: () => context.read<HomeBloc>().add(SetActiveElement(data)),
        onReplace: () => context.read<HomeBloc>().add(DeleteElement(data)),
      ));
    }

    children.add(Expanded(
      child: DragTargetZone.row(
        onAccept: (data) => context
            .read<HomeBloc>()
            .add(AddToEndOfRow(rowIndex: rowIndex, element: data)),
      ),
    ));

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

class UIElementWrapper extends StatelessWidget {
  final DataElement data;
  final bool isActive;
  final void Function() onTap;
  final void Function() onReplace;

  const UIElementWrapper(
      {Key? key,
      required this.data,
      required this.isActive,
      required this.onTap,
      required this.onReplace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return UIElement.fromDataForForm(data: data, isActive: isActive);
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Draggable<DataElement>(
          data: data,
          feedback: UIElement.fromDataForCommon(data: data, isActive: false),
          childWhenDragging: UIElement.fromDataForForm(data: data, isActive: false),
          onDragCompleted: onReplace,
          child: UIElement.fromDataForForm(data: data, isActive: isActive),
        ),
      );
    }
  }
}
