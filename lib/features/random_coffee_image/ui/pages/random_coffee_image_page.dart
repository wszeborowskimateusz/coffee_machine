import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/localizations/localizations.dart';
import 'package:vgv_coffee_machine/core/ui/core_colors.dart';
import 'package:vgv_coffee_machine/core/ui/core_dimensions.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/coffee_image_widget.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_error_widget.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_text.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/cubit_widget.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_cubit.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_state.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';

class RandomCoffeeImagePage
    extends CubitWidget<RandomCoffeeImageCubit, RandomCoffeeImageState> {
  @override
  void initState(RandomCoffeeImageCubit cubit) {
    cubit.generateNewRandomImages();
  }

  @override
  void listen(
    BuildContext context,
    RandomCoffeeImageCubit cubit,
    RandomCoffeeImageState state,
  ) {
    if (state.savingToFavouriteState == SavingToFavouriteState.error) {
      cubit.clearSavingToFavouriteState();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CoreText.body(S.of(context).errorSavingPhotoSnackbarText),
          backgroundColor: CoreColors.error,
        ),
      );
    }
  }

  @override
  Widget build(
    _,
    RandomCoffeeImageCubit cubit,
    RandomCoffeeImageState state,
    __,
  ) {
    if (state.status == RandomCoffeeImageStatus.error) {
      return SizedBox(
        width: double.infinity,
        child: CoreErrorWidget(
          onRefresh: () => cubit.generateNewRandomImages(),
        ),
      );
    }

    return _RandomImageCard(cubit);
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _RandomImageCard extends StatelessWidget {
  final RandomCoffeeImageCubit cubit;

  const _RandomImageCard(this.cubit);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CoreDimensions.paddingS),
      child: Stack(
        children: [
          if (_matchEngine == null ||
              cubit.state.status == RandomCoffeeImageStatus.loading)
            const _LoadingWidget()
          else
            _buildLoadedCard(),
          Positioned(
            bottom: CoreDimensions.paddingL,
            right: CoreDimensions.paddingXS,
            left: CoreDimensions.paddingXS,
            child: _SwipingButtons(_matchEngine),
          ),
        ],
      ),
    );
  }

  MatchEngine? get _matchEngine => cubit.state.matchEngine;

  List<CoffeeImage>? get _images => cubit.state.randomCoffeeImages;

  Widget _buildLoadedCard() {
    return SwipeCards(
      matchEngine: _matchEngine!,
      itemBuilder: (BuildContext context, int index) => Card(
        child: CoffeeImageWidget(_images![index].url),
      ),
      onStackFinished: () => cubit.generateNewRandomImages(),
    );
  }
}

class _SwipingButtons extends StatelessWidget {
  final MatchEngine? matchEngine;

  const _SwipingButtons(this.matchEngine);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIcon(
          context,
          iconData: CoreIcons.skip,
          iconColor: CoreColors.skip,
          onPressed: () => matchEngine?.currentItem?.nope.call(),
        ),
        _buildIcon(
          context,
          iconData: CoreIcons.favourite,
          iconColor: CoreColors.favourites,
          onPressed: () => matchEngine?.currentItem?.like.call(),
        ),
      ],
    );
  }

  Widget _buildIcon(
    BuildContext context, {
    required IconData iconData,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    const size = CoreDimensions.bigIconSize;
    final appThemeCubit = BlocProvider.of<AppThemeCubit>(context, listen: true);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(CoreDimensions.paddingL),
        backgroundColor: appThemeCubit.state == CustomThemeMode.light
            ? CoreColors.swipeIconBackgroundLightMode
            : CoreColors.swipeIconBackgroundDarkMode,
        foregroundColor: iconColor,
      ),
      child: Icon(iconData, color: iconColor, size: size),
    );
  }
}
