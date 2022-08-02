import 'package:flutter/material.dart';

class MusicCoverWidget extends StatefulWidget {
  const MusicCoverWidget({
    Key? key,
    required this.child,
    this.onChangeCoverPosition,
    this.dimension = 60,
    this.isCoverDown = true,
  }) : super(key: key);

  final Widget child;
  final Function()? onChangeCoverPosition;
  final double? dimension;
  final bool isCoverDown;

  @override
  State<MusicCoverWidget> createState() => _MusicCoverWidgetState();
}

class _MusicCoverWidgetState extends State<MusicCoverWidget> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool shouldShowScapeButton = false;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
    _animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation(),
      child: SizedBox.square(
        dimension: widget.dimension,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (event) => setState(() => shouldShowScapeButton = true),
          onExit: (event) => setState(() => shouldShowScapeButton = false),
          child: Stack(children: [
            widget.child,
            if (shouldShowScapeButton) ...[
              Align(
                alignment: Alignment.topRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  opaque: true,
                  child: IconButton(
                      onPressed: widget.onChangeCoverPosition,
                      icon: Icon(icon, color: Colors.white),
                      splashRadius: 10,
                      color: Theme.of(context).primaryColor,
                      hoverColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(4.0),
                      constraints: const BoxConstraints()),
                ),
              )
            ]
          ]),
        ),
      ),
    );
  }

  Animation<Offset> animation() => Tween<Offset>(begin: animationOffset, end: Offset.zero).animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));

  IconData get icon => widget.isCoverDown ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;

  Offset get animationOffset => widget.isCoverDown ? const Offset(-1, 0) : const Offset(0, 1);
}
