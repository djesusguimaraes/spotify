import 'package:flutter/material.dart';
import '../../extensions/text_theme.extension.dart';

class MusicNameWidget extends StatefulWidget {
  const MusicNameWidget({Key? key, this.musicCover}) : super(key: key);

  final Widget? musicCover;

  @override
  State<MusicNameWidget> createState() => _MusicNameWidgetState();
}

class _MusicNameWidgetState extends State<MusicNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Row(children: [
          if (widget.musicCover != null) ...[
            Padding(
                padding: const EdgeInsets.only(right: 12),
                child: widget.musicCover!)
          ],
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dom Corleone do Gueto',
                    style: context.textTheme.bodyText2),
                Text('Eduardo Facção', style: context.textTheme.caption)
              ]),
          const SizedBox(width: 32.0),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_circle_outline))
        ]),
      ),
    );
  }
}
