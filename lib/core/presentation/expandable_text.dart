import 'package:flutter/material.dart';

/// A widget that displays text with "See more" / "See less" functionality
/// for long content that exceeds the specified number of lines.
class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;
  final TextStyle? expandButtonStyle;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxLines = 4,
    this.style,
    this.expandButtonStyle,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;
  bool _isTextOverflowing = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Check if text overflows
        final textSpan = TextSpan(
          text: widget.text,
          style: widget.style ?? Theme.of(context).textTheme.bodyMedium,
        );
        final textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);

        _isTextOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: widget.style ?? Theme.of(context).textTheme.bodyMedium,
              maxLines: _isExpanded ? null : widget.maxLines,
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
            ),
            if (_isTextOverflowing)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    _isExpanded ? 'See less' : 'See more',
                    style:
                        widget.expandButtonStyle ??
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withAlpha(179),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
