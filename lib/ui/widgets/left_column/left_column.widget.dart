import 'package:flutter/material.dart';
import 'package:spotify/ui/extensions/text_theme.extension.dart';
import 'package:spotify/ui/mixins/hover.mixing.dart';

import '../_shared/music_cover.widget.dart';

class LeftColumnWidget extends StatefulWidget {
  const LeftColumnWidget({
    Key? key,
    this.shouldShowCover = false,
    this.onChangeCoverPosition,
  }) : super(key: key);

  final bool shouldShowCover;
  final Function()? onChangeCoverPosition;

  @override
  State<LeftColumnWidget> createState() => _LeftColumnWidgetState();
}

class _LeftColumnWidgetState extends State<LeftColumnWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.more_horiz, size: 30),
        const _ListTileHover(
            label: "Home",
            selectedIcon: Icons.home_filled,
            unselectedIcon: Icons.home_outlined),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end, children: listFoo),
          ),
        ),
        if (widget.shouldShowCover) ...[
          MusicCoverWidget(
            dimension: null,
            onChangeCoverPosition: widget.onChangeCoverPosition,
            isCoverDown: true,
            child: Image.asset(
              'tumb.jpg',
              fit: BoxFit.fill,
            ),
          )
          // buildMusicCover(state: true),
        ]
      ],
    );
  }

  List<Widget> get listFoo => List.generate(
      100,
      (index) => ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          title: Text((index + 1).toString())));
}

class _ListTileHover extends StatefulWidget {
  const _ListTileHover({
    Key? key,
    required this.label,
    this.labelStyle,
    required this.selectedIcon,
    required this.unselectedIcon,
  }) : super(key: key);

  final String label;
  final TextStyle? labelStyle;
  final IconData selectedIcon;
  final IconData unselectedIcon;

  @override
  State<_ListTileHover> createState() => __ListTileHoverState();
}

class __ListTileHoverState extends State<_ListTileHover> with HoverMixin {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setHovering(true),
      onExit: (event) => setHovering(false),
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        title: Text(
          widget.label,
          style: style.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
        leading: Icon(icon, color: color, size: 30),
        onTap: () => setState(() => isSelected = !isSelected),
      ),
    );
  }

  IconData get icon => isSelected ? widget.selectedIcon : widget.unselectedIcon;

  Color get color => (isSelected || isHovering)
      ? Colors.white
      : Theme.of(context).primaryColorLight;

  TextStyle get style => widget.labelStyle ?? context.textTheme.bodyText2!;
}
