import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:design1c/data/data_row.dart';

import '../data/data_element.dart';

abstract class FormEvent {}

class AddToLastRow extends FormEvent {
  final DataElement element;

  AddToLastRow(this.element);
}

class AddToRow extends FormEvent {
  final int rowIndex;
  final int positionInRow;
  final DataElement element;

  AddToRow({
    required this.rowIndex,
    required this.positionInRow,
    required this.element,
  });
}

class InsertInNewRow extends FormEvent {
  final int rowIndex;
  final DataElement element;

  InsertInNewRow({
    required this.rowIndex,
    required this.element,
  });
}

class AddToEndOfRow extends FormEvent {
  final int rowIndex;
  final DataElement element;

  AddToEndOfRow({
    required this.rowIndex,
    required this.element,
  });
}

class OnElementChanged extends FormEvent {
  final DataElement element;

  OnElementChanged(this.element);
}

class SetActiveElement extends FormEvent{
  final DataElement element;

  SetActiveElement(this.element);
}

class DeleteElement extends FormEvent{
  final DataElement element;

  DeleteElement(this.element);
}

class FormState {
  final List<DataElementsRow> rows;

  DataElement? activeElement;

  FormState({required this.rows, this.activeElement});
}

class HomeBloc extends Bloc<FormEvent, FormState> {
  HomeBloc() : super(FormState(rows: [])) {
    on<AddToLastRow>(_addToLastRow);
    on<AddToRow>(_addToRow);
    on<InsertInNewRow>(_insertInNewRow);
    on<AddToEndOfRow>(_addToEndOfRow);
    on<OnElementChanged>(_onElementChanged);
    on<SetActiveElement>(_setActiveElement);
    on<DeleteElement>(_deleteElement);
  }

  FutureOr<void> _addToLastRow(AddToLastRow event, Emitter<FormState> emit) {
    var rows = state.rows.toList();
    final newElement = event.element.copy();
    rows.add(DataElementsRow()..add(newElement));
    emit(FormState(rows: rows, activeElement: newElement));
  }

  FutureOr<void> _addToRow(AddToRow event, Emitter<FormState> emit) {
    var rows = state.rows.toList();
    final newElement = event.element.copy();
    rows[event.rowIndex].insert(event.positionInRow, newElement);
    emit(FormState(rows: rows, activeElement: newElement));
  }

  FutureOr<void> _insertInNewRow(
      InsertInNewRow event, Emitter<FormState> emit) {
    var rows = state.rows.toList();
    final newElement = event.element.copy();
    rows.insert(event.rowIndex, DataElementsRow()..add(newElement));
    emit(FormState(rows: rows, activeElement: newElement));
  }

  FutureOr<void> _addToEndOfRow(AddToEndOfRow event, Emitter<FormState> emit) {
    var rows = state.rows.toList();
    final newElement = event.element.copy();
    rows[event.rowIndex].add(newElement);
    emit(FormState(rows: rows, activeElement: newElement));
  }

  FutureOr<void> _onElementChanged(
      OnElementChanged event, Emitter<FormState> emit) {
    var rows = state.rows.toList();
    for (var row in rows) {
      row.replace(event.element);
    }
    emit(FormState(rows: rows, activeElement: event.element));
  }

  FutureOr<void> _setActiveElement(SetActiveElement event, Emitter<FormState> emit) {
    emit(FormState(rows: state.rows, activeElement: event.element));
  }

  FutureOr<void> _deleteElement(DeleteElement event, Emitter<FormState> emit) {
    var rows = state.rows.toList();
    for (var row in rows) {
      row.delete(event.element);
    }
    rows.removeWhere((row) => row.elements.isEmpty);
    emit(FormState(rows: rows));
  }
}
