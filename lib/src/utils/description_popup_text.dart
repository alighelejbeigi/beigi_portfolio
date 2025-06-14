import 'package:beigi_portfolio/generated/locales.g.dart';
import 'package:beigi_portfolio/src/utils/truncated_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

class DescriptionPopupText extends StatefulWidget {
  final String text;

  const DescriptionPopupText(this.text, {super.key});

  @override
  State<DescriptionPopupText> createState() => _DescriptionPopupTextState();
}

class _DescriptionPopupTextState extends State<DescriptionPopupText> {
  OverlayEntry? _popupEntry;

  void _showPopup(BuildContext context) {
    if (_popupEntry != null) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final overlay = Overlay.of(context);

    _popupEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _hidePopup,
              behavior: HitTestBehavior.translucent,
              child: Container(),
            ),
          ),
          Positioned(
            top: offset.dy + size.height + 4,
            left: offset.dx,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 250,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.text, style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _hidePopup,
                        child: Text(LocaleKeys.share_close.tr),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    overlay.insert(_popupEntry!);
  }

  void _hidePopup() {
    _popupEntry?.remove();
    _popupEntry = null;
  }

  @override
  void dispose() {
    _hidePopup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) => GestureDetector(
        onTap: () => _showPopup(ctx),
        child: TruncatedJustifiedText(
          maxLines: 4,
          text: widget.text,
          style: const TextStyle(
            fontSize: 15.0,
            height: 1.5,
            color: kCaptionColor,
          ),
          ellipsisStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
