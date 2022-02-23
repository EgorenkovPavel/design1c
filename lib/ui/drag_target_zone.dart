import 'package:design1c/data/data_element.dart';
import 'package:design1c/utils/values.dart';
import 'package:flutter/material.dart';

class DragTargetZone extends StatefulWidget {
  final double? width;
  final double? height;
  final void Function(DataElement data) onAccept;
  final bool zoomWidth;
  final bool zoomHeight;

  DragTargetZone.row({this.width, required this.onAccept})
      : height = Dimens.minRowHeigth,
        zoomWidth = true,
        zoomHeight = false;

  DragTargetZone.column({this.height, required this.onAccept})
      : zoomWidth = false,
        zoomHeight = true,
        width = null;

  @override
  State<DragTargetZone> createState() => _DragTargetZoneState();
}

class _DragTargetZoneState extends State<DragTargetZone> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget<DataElement>(
      onAccept: (data) {
        widget.onAccept(data);
        if (isHovered) {
          setState(() {
            isHovered = false;
          });
        }
      },
      onMove: (details) {
        if (!isHovered) {
          setState(() {
            isHovered = true;
          });
        }
      },
      onLeave: (_) {
        if (isHovered) {
          setState(() {
            isHovered = false;
          });
        }
      },
      builder: (context, _, __) => Container(
        color: isHovered ? Colors.grey : Colors.grey[300],
        height: isHovered && widget.zoomHeight && widget.height != null
            ? widget.height! * 2
            : widget.height,
        width: isHovered && widget.zoomWidth && widget.width != null
            ? widget.width! * 2
            : widget.width,
      ),
    );
  }
}
