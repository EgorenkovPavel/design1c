import 'package:design1c/data/data_element.dart';

class DataElementsRow{
  final List<DataElement> elements = [];

  void add(DataElement element) => elements.add(element);

  void insertAfter(DataElement element, DataElement after){
    final index = elements.indexOf(after);
    if (index > 0){
      elements.insert(index, element);
    }
  }

  void insert(int index, DataElement element) => elements.insert(index, element);

  void delete(DataElement element) => elements.remove(element);

  void replace(DataElement before, DataElement after){
    final index = elements.indexOf(before);
    elements[index] = after;
  }
}