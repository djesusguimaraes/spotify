import 'package:flutter/material.dart';
import 'package:spotify/ui/widgets/play_bar/music_name.widget.dart';

import 'widgets/music_cover.widget.dart';
import 'widgets/play_bar/play_bar.widget.dart';
import 'widgets/resizable.widget.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.more_horiz, size: 30),
                    const Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(
                              100,
                              (index) => ListTile(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  title: Text((index + 1).toString()))),
                        ),
                      ),
                    ),
                    if (!isCoverDown) ...[buildMusicCover(state: true)]
                  ],
                ),
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
              MusicNameWidget(
                  musicCover:
                      isCoverDown ? buildMusicCover(state: false) : null),
              const Text('meio'),
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
