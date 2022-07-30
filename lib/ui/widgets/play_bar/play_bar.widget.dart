import 'package:flutter/material.dart';
import '../../extensions/text_theme.extension.dart';

class PlayBarWidget extends StatefulWidget {
  const PlayBarWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  State<PlayBarWidget> createState() => _PlayBarWidgetState();
}

class _PlayBarWidgetState extends State<PlayBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(children: [
          Expanded(
            child: Material(
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(color: context.primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: widget.children,
                ),
              ),
            ),
          )
        ]));
  }
}
