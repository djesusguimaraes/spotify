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
  List<_ListTileHoverItem> items = [
    _ListTileHoverItem(
      label: '',
      selectedIcon: Icons.more_horiz,
      unselectedIcon: Icons.more_horiz,
      onTap: () {},
      labelStyle: null,
    ),
    _ListTileHoverItem(
      label: 'Home',
      selectedIcon: Icons.home,
      unselectedIcon: Icons.home_outlined,
    ),
    _ListTileHoverItem(
      label: 'Buscar',
      selectedIcon: Icons.saved_search_outlined,
      unselectedIcon: Icons.search,
    ),
    _ListTileHoverItem(
      label: 'Sua Biblioteca',
      selectedIcon: Icons.library_add_check,
      unselectedIcon: Icons.library_add_outlined,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
            ...items.map((e) => _ListTileHover(item: e)).toList(),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.end, children: listFoo),
              ),
            ),
          ]),
        ),
      ),
      if (widget.shouldShowCover) ...[
        MusicCoverWidget(
          dimension: null,
          onChangeCoverPosition: widget.onChangeCoverPosition,
          isCoverDown: false,
          child: Image.asset('tumb.jpg', fit: BoxFit.fill),
        )
      ]
    ]);
  }

  List<Widget> get listFoo => List.generate(100, (index) => ListTile(contentPadding: const EdgeInsets.all(8.0), title: Text((index + 1).toString())));
}

class _ListTileHover extends StatefulWidget {
  const _ListTileHover({
    Key? key,
    required this.item,
  }) : super(key: key);

  final _ListTileHoverItem item;

  @override
  State<_ListTileHover> createState() => __ListTileHoverState();
}

class __ListTileHoverState extends State<_ListTileHover> with HoverMixin {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return MouseRegion(
      onEnter: (event) => setHovering(true),
      onExit: (event) => setHovering(false),
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        title: Text(
          item.label,
          style: style.copyWith(color: color, fontWeight: FontWeight.bold, fontSize: 14.0),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Icon(icon, color: color, size: 25),
        onTap: () {
          setState(() => isSelected = !isSelected);
          item.onTap?.call();
        },
      ),
    );
  }

  IconData get icon => isSelected ? widget.item.selectedIcon : widget.item.unselectedIcon;

  Color get color => (isSelected || isHovering) ? Colors.white : Theme.of(context).primaryColorLight;

  TextStyle get style => widget.item.labelStyle ?? context.textTheme.bodyText2!;
}

class _ListTileHoverItem {
  final String label;
  final TextStyle? labelStyle;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final Function()? onTap;

  _ListTileHoverItem({
    required this.label,
    this.labelStyle,
    required this.selectedIcon,
    required this.unselectedIcon,
    this.onTap,
  });
}
