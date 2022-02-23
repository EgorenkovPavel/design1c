import 'package:design1c/data/data_element.dart';

class DataCheckbox extends DataElement{

  final String title;

  DataCheckbox({
    String? id,
    required this.title,
  }) : super(id: id ?? DataElement.newId());

  @override
  DataCheckbox copyWith({
    String? id,
    String? title,
  }) =>
      DataCheckbox(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }

}