import 'package:uuid/uuid.dart';

abstract class DataElement {

  static String newId() => const Uuid().v1();

  final String id;

  DataElement({required this.id});

  DataElement copy();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DataElement &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}