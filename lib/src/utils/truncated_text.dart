import 'package:flutter/material.dart';

class TruncatedJustifiedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;
  final TextStyle ellipsisStyle;

  const TruncatedJustifiedText({
    super.key,
    required this.text,
    required this.style,
    this.maxLines = 4,
    required this.ellipsisStyle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final direction = Directionality.of(context);
        const ellipsis = ' ... ';

        final tp = TextPainter(
          text: TextSpan(text: text, style: style),
          textDirection: direction,
          maxLines: maxLines,
        );
        tp.layout(maxWidth: constraints.maxWidth);

        if (!tp.didExceedMaxLines) {
          return Text(
            text,
            style: style,
            textAlign: TextAlign.justify,
            maxLines: maxLines,
          );
        }

        int min = 0;
        int max = text.length;
        int cutIndex = 0;

        while (min <= max) {
          final mid = (min + max) ~/ 2;
          final testText = text.substring(0, mid) + ellipsis;
          final testPainter = TextPainter(
            text: TextSpan(text: testText, style: style),
            textDirection: direction,
            maxLines: maxLines,
          );
          testPainter.layout(maxWidth: constraints.maxWidth);

          if (testPainter.didExceedMaxLines) {
            max = mid - 1;
          } else {
            cutIndex = mid;
            min = mid + 1;
          }
        }

        final visible = text.substring(0, cutIndex).trimRight();

        return RichText(
          textAlign: TextAlign.justify,
          textDirection: direction,
          text: TextSpan(
            style: style,
            children: [
              TextSpan(text: visible),
              TextSpan(text: ellipsis, style: ellipsisStyle),
            ],
          ),
          maxLines: maxLines,
          overflow: TextOverflow.clip,
        );
      },
    );
  }
}
