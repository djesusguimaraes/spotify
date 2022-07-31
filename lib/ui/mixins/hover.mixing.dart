import 'package:flutter/cupertino.dart';

mixin HoverMixin<T extends StatefulWidget> on State<T> {
  bool isHovering = false;

  setHovering(bool state) => setState(() => isHovering = state);
}
