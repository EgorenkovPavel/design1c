
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<Color?> chooseColor(BuildContext context, Color color){
  return showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return _ColorChooser(color: color);
    },
  );
}

class _ColorChooser extends StatefulWidget {
  const _ColorChooser({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  _ColorChooserState createState() => _ColorChooserState();
}

class _ColorChooserState extends State<_ColorChooser> {
  Color pickerColor = Colors.amber;

  @override
  void initState() {
    super.initState();
    pickerColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: pickerColor,
          paletteType: PaletteType.hueWheel,
          onColorChanged: (color){
            setState(() {
              pickerColor = color;
            });
          },
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Got it'),
          onPressed: () {
            Navigator.of(context).pop(pickerColor);
          },
        ),
      ],
    );
  }
}
