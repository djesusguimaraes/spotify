import 'package:flutter/material.dart';
import 'package:spotify/ui/widgets/_shared/link_text.widget.dart';
import 'package:spotify/ui/widgets/left_column/left_column.widget.dart';
import 'package:spotify/ui/widgets/play_bar/music_name.widget.dart';

import 'widgets/_shared/music_cover.widget.dart';
import 'widgets/_shared/resizable.widget.dart';
import 'widgets/play_bar/play_bar.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCoverDown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return Column(children: [
          Expanded(
            child: Row(children: [
              ResizableWidget(
                child: LeftColumnWidget(
                    shouldShowCover: !isCoverDown,
                    onChangeCoverPosition: () =>
                        setState(() => isCoverDown = true)),
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
                  child: Column(children: [Expanded(child: Container())]))
            ]),
          ),
          PlayBarWidget(
            children: [
              // TODO: Mover apresentação do MusicCover para dentro de MusicName
              MusicNameWidget(
                  musicCover:
                      isCoverDown ? buildMusicCover(state: false) : null),
              const LinkTextWidget('Meio'),
              const Text('fim')
            ],
          )
        ]);
      })),
    );
  }

  buildMusicCover({required bool state, double? customWidth}) =>
      MusicCoverWidget(
        onChangeCoverPosition: () => setState(() => isCoverDown = state),
        isCoverDown: state,
        dimension: customWidth,
        child: Image.asset(
          'tumb.jpg',
          fit: BoxFit.fill,
        ),
      );
}
