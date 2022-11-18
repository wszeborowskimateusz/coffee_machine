// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../features/favourite_coffee_images/ui/pages/favourites_coffee_images_page.dart'
    as _i3;
import '../../features/random_coffee_image/ui/pages/random_coffee_image_page.dart'
    as _i2;
import '../../features/settings/ui/pages/settings_page.dart' as _i4;
import '../ui/pages/home_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(),
      );
    },
    RandomCoffeeImageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.RandomCoffeeImagePage(),
      );
    },
    FavouriteCoffeeImagesRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.FavouriteCoffeeImagesPage(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SettingsPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              RandomCoffeeImageRouter.name,
              path: 'randomCoffeeImage',
              parent: HomeRoute.name,
            ),
            _i5.RouteConfig(
              FavouriteCoffeeImagesRouter.name,
              path: 'favouriteCoffeeImages',
              parent: HomeRoute.name,
            ),
            _i5.RouteConfig(
              SettingsRouter.name,
              path: 'settings',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.RandomCoffeeImagePage]
class RandomCoffeeImageRouter extends _i5.PageRouteInfo<void> {
  const RandomCoffeeImageRouter()
      : super(
          RandomCoffeeImageRouter.name,
          path: 'randomCoffeeImage',
        );

  static const String name = 'RandomCoffeeImageRouter';
}

/// generated route for
/// [_i3.FavouriteCoffeeImagesPage]
class FavouriteCoffeeImagesRouter extends _i5.PageRouteInfo<void> {
  const FavouriteCoffeeImagesRouter()
      : super(
          FavouriteCoffeeImagesRouter.name,
          path: 'favouriteCoffeeImages',
        );

  static const String name = 'FavouriteCoffeeImagesRouter';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRouter extends _i5.PageRouteInfo<void> {
  const SettingsRouter()
      : super(
          SettingsRouter.name,
          path: 'settings',
        );

  static const String name = 'SettingsRouter';
}
