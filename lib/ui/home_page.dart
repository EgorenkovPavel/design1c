import 'package:design1c/data/data_element.dart';
import 'package:design1c/ui/common_elements_panel.dart';
import 'package:design1c/ui/edit_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'main_form.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({
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
          MainForm(),
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

