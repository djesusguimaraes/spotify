import 'package:flutter/material.dart';

enum AxisResizable {
  left,
  right;

  bool get isLeft => this == AxisResizable.left;
  bool get isRight => this == AxisResizable.right;
}

class ResizableWidget extends StatefulWidget {
  const ResizableWidget({
    Key? key,
    this.axisResizable = AxisResizable.left,
    required this.child,
    this.initialWidth = 150,
  }) : super(key: key);

  final AxisResizable axisResizable;
  final double initialWidth;
  final Widget child;

  @override
  State<ResizableWidget> createState() => _ResizableWidgetState();
}

class _ResizableWidgetState extends State<ResizableWidget> {
  double width = 0;
  double minWidth = 0;
  double maxWidth = 0;
  double initX = 0;
  bool shouldBeTransparent = true;

  @override
  void initState() {
    width = widget.initialWidth;
    minWidth = 140;
    maxWidth = width * 1.75;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (widget.axisResizable.isLeft) ...[Container(color: Colors.black, width: width, child: widget.child)],
      MouseRegion(
        cursor: SystemMouseCursors.resizeColumn,
        child: GestureDetector(
          onHorizontalDragEnd: _handleEndDrag,
          onHorizontalDragUpdate: _handleUpdateDrag,
          onHorizontalDragStart: _handleStarDrag,
          child: AnimatedContainer(duration: const Duration(milliseconds: 100), color: shouldBeTransparent ? Colors.transparent : Colors.white, width: 1),
        ),
      ),
      if (widget.axisResizable.isRight) ...[Container(color: Colors.black, width: width, child: widget.child)],
    ]);
  }

  double get currentWidth => width;

  void onDrag(double dx) {
    double newWidth = widget.axisResizable.isLeft ? (width + dx) : (width - dx);

    if (newWidth > maxWidth) {
      newWidth = maxWidth;
    }
    if (newWidth < minWidth) {
      newWidth = minWidth;
    }
    setState(() => width = newWidth);
  }

  _handleStarDrag(DragStartDetails details) {
    setState(() {
      shouldBeTransparent = false;
      initX = details.globalPosition.dx;
    });
  }

  _handleUpdateDrag(DragUpdateDetails details) {
    var dx = details.globalPosition.dx - initX;
    initX = details.globalPosition.dx;
    onDrag(dx);
  }

  _handleEndDrag(DragEndDetails details) {
    setState(() => shouldBeTransparent = true);
  }
}
