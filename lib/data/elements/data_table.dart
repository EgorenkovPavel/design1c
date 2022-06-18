import 'package:design1c/data/data_element.dart';

class DataTable extends DataElement{

  final List<String> items;

  DataTable({
    String? id,
    required this.items,
  }) : super(id: id ?? DataElement.newId());

  DataTable copyWith({
    String? id,
    List<String>? items,
  }) =>
      DataTable(
        id: id ?? this.id,
        items: items ?? this.items,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}