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
import 'home_bloc.dart';

class MainForm extends StatelessWidget {
  const MainForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      //height: 500,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: Border.all(color: FormColors.formBorderColor),
          color: FormColors.formBackgroungColor),
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
        height: Dimens.heightBeetwinElements,
      ));
      children.add(makeRow(context, row, i));
    }

    children.add(Expanded(
      child: DragTargetZone.column(
        onAccept: (data) => context.read<HomeBloc>().add(AddToLastRow(data)),
        height: Dimens.heightBeetwinElements,
      ),
    ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget makeRow(BuildContext context, DataElementsRow row, int rowIndex) {
    List<Widget> children = [];
    for (var i = 0; i < row.elements.length; i++) {
      var data = row.elements[i];
      children.add(
        DragTargetZone.row(
          onAccept: (data) => context.read<HomeBloc>().add(AddToRow(
              rowIndex: rowIndex, positionInRow: i, element: data.copy())),
          width: Dimens.widthBeetwinElements,
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

class FormTitle extends StatelessWidget {
  const FormTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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

  Widget _fromData({
    required DataElement data,
    required bool isActive,
    void Function(DataElement newData)? onUpdate,
  }) {
    if (data is DataButton) {
      return UIButton(data: data, isActive: isActive);
    } else if (data is DataText) {
      return UIText(data: data, isActive: isActive);
    } else if (data is DataField) {
      return UIField(data: data, isActive: isActive);
    } else if (data is DataCheckbox) {
      return UICheckbox(data: data, isActive: isActive);
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return _fromData(data: data, isActive: isActive);
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Draggable<DataElement>(
          data: data,
          feedback: _fromData(data: data, isActive: false),
          childWhenDragging: _fromData(data: data, isActive: false),
          onDragCompleted: onReplace,
          child: _fromData(data: data, isActive: isActive),
        ),
      );
    }
  }
}
