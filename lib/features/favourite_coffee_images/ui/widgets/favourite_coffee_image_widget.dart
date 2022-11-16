import 'package:flutter/material.dart';
import 'package:vgv_coffee_machine/core/ui/core_colors.dart';
import 'package:vgv_coffee_machine/core/ui/core_dimensions.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/coffee_image_widget.dart';

class FavouriteCoffeeImageWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onUnsave;

  const FavouriteCoffeeImageWidget({
    required this.imageUrl,
    required this.onUnsave,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: CoffeeImageWidget(imageUrl)),
        Positioned(
          top: CoreDimensions.paddingXS,
          right: CoreDimensions.paddingXS,
          child: _UnsaveButton(onUnsave),
        )
      ],
    );
  }
}

class _UnsaveButton extends StatelessWidget {
  final VoidCallback onUnsave;

  const _UnsaveButton(this.onUnsave);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CoreColors.favourites,
      child: IconButton(
        onPressed: onUnsave,
        icon: const Icon(CoreIcons.unFavourite),
        color: CoreColors.black,
      ),
    );
  }
}
