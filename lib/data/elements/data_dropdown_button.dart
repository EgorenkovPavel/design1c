import 'package:design1c/data/data_element.dart';

class DataDropdownButton extends DataElement{

  final String title;

  DataDropdownButton({
    String? id,
    required this.title,
  }) : super(id: id ?? DataElement.newId());

  DataDropdownButton copyWith({
    String? id,
    String? title,
  }) =>
      DataDropdownButton(
        id: id ?? this.id,
        title: title ?? this.title,
      );


  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }

}