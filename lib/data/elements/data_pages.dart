import 'package:design1c/data/data_element.dart';

class DataPages extends DataElement{

  final List<String> items;

  DataPages({
    String? id,
    required this.items,
  }) : super(id: id ?? DataElement.newId());

  DataPages copyWith({
    String? id,
    List<String>? items,
  }) =>
      DataPages(
        id: id ?? this.id,
        items: items ?? this.items,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}