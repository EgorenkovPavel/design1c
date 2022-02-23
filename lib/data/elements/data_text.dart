import 'package:design1c/data/data_element.dart';

class DataText extends DataElement {
  final String text;
  final double width;

  DataText({
    String? id,
    required this.text,
    required this.width,
  }) : super(id: id ?? DataElement.newId());

  DataText copyWith({
    String? id,
    String? text,
    double? width,
  }) =>
      DataText(
        text: text ?? this.text,
        id: id ?? this.text,
        width: width ?? this.width,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}
