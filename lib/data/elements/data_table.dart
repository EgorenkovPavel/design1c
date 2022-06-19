import 'package:design1c/data/data_element.dart';

class DataFormTable extends DataElement{

  final int rowCount;
  final List<String> columns;

  DataFormTable({
    String? id,
    required this.columns,
    this.rowCount = 1,
  }) : super(id: id ?? DataElement.newId());

  DataFormTable copyWith({
    String? id,
    List<String>? columns,
    int? rowCount,
  }) =>
      DataFormTable(
        id: id ?? this.id,
        columns: columns ?? this.columns,
        rowCount: rowCount ?? this.rowCount,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}