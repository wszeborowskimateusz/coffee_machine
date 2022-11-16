part of 'smoke_test.dart';

final coffeeImage = find.byType(CachedNetworkImage);
final favouritesIcon = find.byIcon(CoreIcons.favourite);
final unFavouriteIcon = find.byIcon(CoreIcons.unFavourite);
final favouriteBottomBarIcon = find.descendant(
  of: find.byType(SalomonBottomBar),
  matching: favouritesIcon,
);
final swipeBottomBarIcon = find.descendant(
  of: find.byType(SalomonBottomBar),
  matching: find.byIcon(CoreIcons.swipe),
);
final favouriteButtonIcon = find.descendant(
  of: find.byType(ElevatedButton),
  matching: favouritesIcon,
);
final skipButtonIcon = find.descendant(
  of: find.byType(ElevatedButton),
  matching: find.byIcon(CoreIcons.skip),
);
final swipeTabCoffeeImage = find.descendant(
  of: find.byType(RandomCoffeeImagePage),
  matching: coffeeImage,
);
final favouritesTabCoffeeImage = find.descendant(
  of: find.byType(FavouriteCoffeeImagesPage),
  matching: coffeeImage,
);

void findsSwipeCardsWithImagesAndActionButtons() {
  expect(find.byType(SwipeCards), findsOneWidget);
  expect(swipeTabCoffeeImage, findsAtLeastNWidgets(1));
  expect(skipButtonIcon, findsOneWidget);
  expect(favouriteButtonIcon, findsOneWidget);
}

Future<void> goToFavouritesTab(WidgetTester tester) async {
  await tester.tapAndPump(favouriteBottomBarIcon);
}

void findsNoImagesOnFavouritesTab() {
  expect(favouritesTabCoffeeImage, findsNothing);
}

Future<void> goToRandomImageTab(WidgetTester tester) async {
  await tester.tapAndPump(swipeBottomBarIcon);
}

void findsAButtonToFavouriteAnImage() {
  expect(favouriteButtonIcon, findsOneWidget);
}

void findsAButtonToSkipAnImage() {
  expect(skipButtonIcon, findsOneWidget);
}

Future<void> skipsAnImageAndGoesToFavouritesTab(WidgetTester tester) async {
  await tester.tapAndPump(skipButtonIcon);
  await tester.tapAndPump(favouriteBottomBarIcon);
}

Future<void> favouritesAnImageAndGoesToFavouritesTab(
    WidgetTester tester) async {
  await tester.tapAndPump(favouriteButtonIcon);
  await tester.tapAndPump(favouriteBottomBarIcon);
}

void findsOneImageInFavouritesTab() {
  expect(favouritesTabCoffeeImage, findsOneWidget);
}

void findsUnFavouriteIcon() {
  expect(unFavouriteIcon, findsOneWidget);
}

Future<void> tapUnFavouriteIcon(WidgetTester tester) async {
  await tester.tapAndPump(unFavouriteIcon);
}
