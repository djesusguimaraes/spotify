import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Row(children: [
              ResizableWidget(
                child: Column(children: [Expanded(child: Container())]),
              ),
              Expanded(
                  child: Column(children: [
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      colors: [
                        Colors.black12,
                        Colors.black26,
                        Colors.black38,
                        Colors.black45,
                      ],
                    ),
                  ),
                ))
              ])),
              ResizableWidget(
                  axisResizable: AxisResizable.right,
                  child: Column(
                    children: [Expanded(child: Container())],
                  ))
            ]),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: 100,
                    child: Row(children: [
                      Expanded(child: Container(color: Colors.green))
                    ])))
          ],
        );
      })),
    );
  }
}

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
    minWidth = width * .5;
    maxWidth = width * 1.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      if (widget.axisResizable.isLeft) ...[
        SizedBox(width: width, child: widget.child)
      ],
      MouseRegion(
        cursor: SystemMouseCursors.resizeColumn,
        child: GestureDetector(
          onHorizontalDragEnd: _handleEndDrag,
          onHorizontalDragUpdate: _handleUpdateDrag,
          onHorizontalDragStart: _handleStarDrag,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            color: shouldBeTransparent ? Colors.transparent : Colors.white,
            width: 2,
          ),
        ),
      ),
      if (widget.axisResizable.isRight) ...[
        SizedBox(width: width, child: widget.child)
      ],
    ]);
  }

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
