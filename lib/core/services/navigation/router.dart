import 'package:auto_route/auto_route.dart';
import 'package:vgv_coffee_machine/core/ui/pages/home_page.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/pages/favourites_coffee_images_page.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/pages/random_coffee_image_page.dart';
import 'package:vgv_coffee_machine/features/settings/ui/pages/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'randomCoffeeImage',
          name: 'RandomCoffeeImageRouter',
          page: RandomCoffeeImagePage,
        ),
        AutoRoute(
          path: 'favouriteCoffeeImages',
          name: 'FavouriteCoffeeImagesRouter',
          page: FavouriteCoffeeImagesPage,
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
        )
      ],
    )
  ],
)
class $AppRouter {}
