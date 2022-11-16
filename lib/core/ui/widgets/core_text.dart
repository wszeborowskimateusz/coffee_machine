import 'package:flutter/material.dart';
import 'package:vgv_coffee_machine/core/ui/core_text_style_tokens.dart';

class CoreText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const CoreText._(this.text, this.style);

  factory CoreText.body(String text) => CoreText._(
        text,
        CoreTextStyleTokens.body,
      );

  factory CoreText.title(String text) => CoreText._(
        text,
        CoreTextStyleTokens.title,
      );

  factory CoreText.titleLg(String text) => CoreText._(
        text,
        CoreTextStyleTokens.titleLg,
      );

  @override
  Widget build(BuildContext context) => Text(text, style: style);
}
