import '../data_element.dart';

class DataHyperlink extends DataElement {
  final String text;
  final double width;

  DataHyperlink({
    String? id,
    required this.text,
    required this.width,
  }) : super(id: id ?? DataElement.newId());

  DataHyperlink copyWith({
    String? id,
    String? text,
    double? width,
  }) =>
      DataHyperlink(
        text: text ?? this.text,
        id: id ?? this.id,
        width: width ?? this.width,
      );

  @override
  DataElement copy() {
    return copyWith(id: DataElement.newId());
  }
}
