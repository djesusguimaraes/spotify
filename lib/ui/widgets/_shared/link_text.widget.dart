import 'package:spotify/ui/extensions/text_theme.extension.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify/ui/mixins/hover.mixing.dart';

class LinkTextWidget extends StatefulWidget {
  const LinkTextWidget(
    this.text, {
    Key? key,
    this.onTap,
    this.style,
    this.isTittle = false,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final TextStyle? style;
  final bool isTittle;

  @override
  State<LinkTextWidget> createState() => _LinkTextWidgetState();
}

class _LinkTextWidgetState extends State<LinkTextWidget> with HoverMixin {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget.text,
        mouseCursor: SystemMouseCursors.click,
        onEnter: (event) => setHovering(true),
        onExit: (event) => setHovering(false),
        recognizer: TapGestureRecognizer()..onTap = widget.onTap,
        spellOut: true,
        style: effectiveTextTheme.copyWith(
          decoration: textDecoration,
          color: Colors.transparent,
          fontWeight: fontWeight,
          shadows: [Shadow(offset: const Offset(0, -3), color: textColor)],
          decorationColor: Colors.white,
        ),
      ),
    );
  }

  TextStyle get effectiveTextTheme =>
      widget.style ?? context.textTheme.bodyText2!;

  TextDecoration? get textDecoration {
    if (isHovering) {
      return TextDecoration.underline;
    }
    return null;
  }

  Color get textColor {
    if (widget.isTittle) {
      return Colors.white;
    }
    if (isHovering) {
      return Colors.white;
    }
    return Theme.of(context).primaryColorLight;
  }

  FontWeight? get fontWeight {
    if (widget.isTittle) {
      return FontWeight.bold;
    }
    return null;
  }
}
