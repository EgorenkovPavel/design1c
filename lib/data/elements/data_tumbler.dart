import 'package:design1c/data/data_element.dart';

class DataTumbler extends DataElement{

  final List<String> items;

  DataTumbler({
    String? id,
    required this.items,
  }) : super(id: id ?? DataElement.newId());

  DataTumbler copyWith({
    String? id,
    List<String>? items,
  }) =>
      DataTumbler(
        id: id ?? this.id,
        items: items ?? this.items,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}