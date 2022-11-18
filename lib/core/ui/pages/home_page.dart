import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vgv_coffee_machine/core/localizations/localizations.dart';
import 'package:vgv_coffee_machine/core/navigation/router.gr.dart';
import 'package:vgv_coffee_machine/core/ui/core_colors.dart';
import 'package:vgv_coffee_machine/core/ui/core_dimensions.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_text.dart';

class HomePage extends StatelessWidget {
  static const _iconSize = CoreDimensions.bottomBarIconSize;

  @override
  Widget build(BuildContext context) {
    final translations = S.of(context);
    final pageTitles = [
      translations.swipe,
      translations.favourites,
      translations.settings,
    ];
    final bottomBarItems = [
      SalomonBottomBarItem(
        selectedColor: CoreColors.swipe,
        icon: const Icon(
          CoreIcons.swipe,
          size: _iconSize,
        ),
        title: CoreText.body(pageTitles[0]),
      ),
      SalomonBottomBarItem(
        selectedColor: CoreColors.favourites,
        icon: const Icon(
          CoreIcons.favourite,
          size: _iconSize,
        ),
        title: CoreText.body(pageTitles[1]),
      ),
      SalomonBottomBarItem(
        selectedColor: CoreColors.settings,
        icon: const Icon(
          CoreIcons.settings,
          size: _iconSize,
        ),
        title: CoreText.body(pageTitles[2]),
      ),
    ];

    return AutoTabsScaffold(
      routes: const [
        RandomCoffeeImageRouter(),
        FavouriteCoffeeImagesRouter(),
        SettingsRouter(),
      ],
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: CoreColors.appBarColor,
        title: CoreText.titleLg(pageTitles[tabsRouter.activeIndex]),
        centerTitle: true,
        leading: const AutoLeadingButton(),
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: CoreDimensions.bottomBarHorizontalPadding,
            vertical: CoreDimensions.bottomBarVerticalPadding,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: bottomBarItems,
        );
      },
    );
  }
}
