import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

import '../../data/elements/data_table.dart';

class UITableCommon extends StatelessWidget {
  final DataFormTable data;
  final bool isActive;

  const UITableCommon({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    for (int i=0;i<data.columns.length;i++){
      children.add(UITableColumn(title: data.columns[i], last: i == data.columns.length - 1));
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
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class UIFormTable extends StatelessWidget {
  final DataFormTable data;
  final bool isActive;

  const UIFormTable({
    Key? key,
    required this.data,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    for (int i=0;i<data.columns.length;i++){
      children.add(UITableColumn(title: data.columns[i], last: i == data.columns.length - 1));
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
            children: children
                .map<Widget>(
                    (child) => Expanded(child: child))
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
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
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: FormColors.tableHeaderBackgroundColor,
        border: Border(
          bottom: BorderSide(color: FormColors.tableBorderColor),
          right: last ? BorderSide.none : BorderSide(color: FormColors.tableBorderColor),
        ),
      ),
      child: Text(title, style: TextStyle(fontSize: 12)),
    );
  }
}
