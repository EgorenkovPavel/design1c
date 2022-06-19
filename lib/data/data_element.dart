import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

abstract class DataElement extends Equatable {

  static String newId() => const Uuid().v1();

  final String id;

  const DataElement({required this.id});

  DataElement copy();

  @override
  List<Object> get props => [id];

}