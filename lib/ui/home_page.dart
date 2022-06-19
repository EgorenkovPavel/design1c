import 'package:design1c/data/data_element.dart';
import 'package:design1c/ui/common_elements_panel.dart';
import 'package:flutter/material.dart';

import 'main_form.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonElementsPanel(),
          const Spacer(),
          const MainForm(),
          const Spacer(),
          // SizedBox(
          //   width: 300,
          //   child: context.select((HomeBloc bloc) => bloc.state.activeElement) activeElement == null
          //       ? const SizedBox()
          //       : EditPanel.fromData(activeElement!, updateActiveElement),
          // ),
        ],
      ),
    );
  }

  void updateActiveElement(DataElement newData) {
    // setState(() {
    //   _rows
    //       .firstWhere((row) => row.elements.contains(activeElement))
    //       .replace(activeElement!, newData);
    //   activeElement = newData;
    // });
  }
}

