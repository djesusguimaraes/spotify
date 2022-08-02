import 'package:flutter/material.dart';
import 'package:spotify/ui/widgets/_shared/link_text.widget.dart';
import '../../extensions/text_theme.extension.dart';
import '../_shared/music_cover.widget.dart';

class MusicNameWidget extends StatefulWidget {
  const MusicNameWidget({Key? key, this.shouldShowCover = true, this.onChangeCoverPosition}) : super(key: key);

  final bool shouldShowCover;
  final Function()? onChangeCoverPosition;

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
          if (widget.shouldShowCover) ...[
            Padding(
                padding: const EdgeInsets.only(right: 12),
                child: MusicCoverWidget(
                  dimension: null,
                  onChangeCoverPosition: widget.onChangeCoverPosition,
                  isCoverDown: true,
                  child: Image.asset(
                    'tumb.jpg',
                    fit: BoxFit.fill,
                  ),
                ))
          ],
          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
            const LinkTextWidget('Dom Corleone do Gueto', isTittle: true),
            const SizedBox(height: 4.0),
            LinkTextWidget('Eduardo Facção', style: context.textTheme.caption),
          ]),
          const SizedBox(width: 32.0),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle_outline))
        ]),
      ),
    );
  }
}
