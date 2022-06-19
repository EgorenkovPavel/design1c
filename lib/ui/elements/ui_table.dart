import 'package:design1c/ui/active_element_border.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/elements/data_table.dart';
import '../home_bloc.dart';

class UITableCommon extends StatelessWidget {
  final DataFormTable data;

  const UITableCommon({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    for (int i = 0; i < data.columns.length; i++) {
      children.add(UITableColumn(
          title: data.columns[i], last: i == data.columns.length - 1));
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: FormColors.tableBorderColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: children,
          ),
          SizedBox(
            height: Dimens.tableRowHeight * data.rowCount,
          ),
        ],
      ),
    );
  }
}

class UIFormTable extends StatefulWidget {
  final DataFormTable data;
  final bool isActive;

  const UIFormTable({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  @override
  State<UIFormTable> createState() => _UIFormTableState();
}

class _UIFormTableState extends State<UIFormTable> {
  late DataFormTable _data;
  late double _height;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
    _height = Dimens.tableRowHeight * _data.rowCount + Dimens.tableHeaderHeight;
  }

  void onResize(double delta) {
    _height += delta;
    setState(() {});

    final newRowCount = ((_height - Dimens.tableHeaderHeight) / Dimens.tableRowHeight).round();
    if( newRowCount != _data.rowCount){
      _data = _data.copyWith(rowCount: newRowCount);
      context.read<HomeBloc>().add(OnElementChanged(_data));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    for (int i = 0; i < widget.data.columns.length; i++) {
      children.add(UITableColumn(
          title: widget.data.columns[i], last: i == widget.data.columns.length - 1));
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: FormColors.tableBorderColor),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: children
                        .map<Widget>((child) => Expanded(child: child))
                        .toList(),
                  ),
                  SizedBox(
                    height: Dimens.tableRowHeight * _data.rowCount,
                  ),
                ],
              ),
              if (widget.isActive)
                ActiveElementBorder(
                  width: constraints.maxWidth,
                  height: _height,
                  horizontalResizeAvailable: false,
                  verticalResizeAvailable: true,
                  onVerticalResize: onResize,
                )
            ],
          );
        },
      ),
    );
  }
}

class UITableColumn extends StatelessWidget {
  final String title;
  final bool last;

  const UITableColumn({
    Key? key,
    required this.title,
    required this.last,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.tableHeaderHeight,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: FormColors.tableHeaderBackgroundColor,
        border: Border(
          bottom: BorderSide(color: FormColors.tableBorderColor),
          right: last
              ? BorderSide.none
              : BorderSide(color: FormColors.tableBorderColor),
        ),
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: TextStyle(fontSize: 12))),
    );
  }
}
