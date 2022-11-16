import 'package:flutter/material.dart';
import 'package:vgv_coffee_machine/core/localizations/localizations.dart';
import 'package:vgv_coffee_machine/core/ui/core_dimensions.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_text.dart';

class CoreErrorWidget extends StatelessWidget {
  final VoidCallback? onRefresh;

  const CoreErrorWidget({this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          CoreIcons.errorImage,
          size: CoreDimensions.coreErrorWidgetImageSize,
        ),
        const SizedBox(height: CoreDimensions.paddingL),
        CoreText.title(S.of(context).coreErrorWidgetTitle),
        if (onRefresh != null) ...{
          const SizedBox(height: CoreDimensions.paddingL),
          ElevatedButton(
            onPressed: onRefresh,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CoreText.title(S.of(context).coreErrorWidgetCta),
                const Icon(CoreIcons.refresh),
              ],
            ),
          )
        }
      ],
    );
  }
}
