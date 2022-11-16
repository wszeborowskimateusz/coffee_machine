import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/pages/favourites_coffee_images_page.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/pages/random_coffee_image_page.dart';

import 'widget_tester_extensions.dart';

part '_integration_test_helper.dart';

void main() {
  testWidgets(
    'Should properly be able to add and remove photos from favourites',
    (WidgetTester tester) async {
      await tester.pumpApp();

      findsSwipeCardsWithImagesAndActionButtons();

      await goToFavouritesTab(tester);

      findsNoImagesOnFavouritesTab();

      await goToRandomImageTab(tester);

      findsAButtonToSkipAnImage();

      await skipsAnImageAndGoesToFavouritesTab(tester);

      findsNoImagesOnFavouritesTab();

      await goToRandomImageTab(tester);

      findsAButtonToFavouriteAnImage();

      await favouritesAnImageAndGoesToFavouritesTab(tester);

      findsOneImageInFavouritesTab();

      findsUnFavouriteIcon();

      await tapUnFavouriteIcon(tester);

      findsNoImagesOnFavouritesTab();
    },
  );
}
