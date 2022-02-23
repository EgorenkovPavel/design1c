import 'package:design1c/data/data_element.dart';

class DataField extends DataElement {
  final String hint;
  final double width;

  DataField({
    String? id,
    required this.hint,
    required this.width,
  }) : super(id: id ?? DataElement.newId());

  DataField copyWith({
    String? id,
    String? hint,
    double? width,
  }) =>
      DataField(
        hint: hint ?? this.hint,
        width: width ?? this.width,
        id: id ?? this.id,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}
