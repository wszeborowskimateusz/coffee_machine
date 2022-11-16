import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vgv_coffee_machine/core/localizations/localizations.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_text.dart';

class CoffeeImageWidget extends StatelessWidget {
  final String url;

  const CoffeeImageWidget(this.url);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
      errorWidget: (_, __, ___) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CoreIcons.errorImage),
          CoreText.body(S.of(context).imageLoadingFailed),
        ],
      ),
    );
  }
}
