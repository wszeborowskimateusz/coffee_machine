import 'package:flutter/material.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/localizations/localizations.dart';
import 'package:vgv_coffee_machine/core/ui/core_dimensions.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_error_widget.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_text.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/cubit_widget.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_cubit.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_state.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/widgets/favourite_coffee_image_widget.dart';

class FavouriteCoffeeImagesPage extends CubitWidget<FavouriteCoffeeImagesCubit,
    FavouriteCoffeeImagesState> {
  @override
  void initState(FavouriteCoffeeImagesCubit cubit) {
    cubit.getFavouriteCoffeeImages();
  }

  @override
  Widget build(
    BuildContext context,
    FavouriteCoffeeImagesCubit cubit,
    FavouriteCoffeeImagesState state,
    CubitWidgetState widgetState,
  ) {
    return SizedBox(
      width: double.infinity,
      child: state.map(
        loading: (_) => const _LoadingWidget(),
        error: (_) => CoreErrorWidget(
          onRefresh: () => cubit.getFavouriteCoffeeImages(),
        ),
        loaded: (imagesState) => imagesState.images.isEmpty
            ? const _EmptyState()
            : _LoadedState(cubit, imagesState.images),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CoreText.title(S.of(context).favouritesEmptyStateTitle),
          const SizedBox(height: CoreDimensions.paddingS),
          CoreText.body(S.of(context).favouritesEmptyStateBody),
        ],
      ),
    );
  }
}

class _LoadedState extends StatelessWidget {
  final FavouriteCoffeeImagesCubit cubit;
  final List<CoffeeImage> images;

  const _LoadedState(this.cubit, this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        return FavouriteCoffeeImageWidget(
          imageUrl: image.url,
          onUnsave: () => cubit.unsaveImageFromFavourites(image),
        );
      },
    );
  }
}
