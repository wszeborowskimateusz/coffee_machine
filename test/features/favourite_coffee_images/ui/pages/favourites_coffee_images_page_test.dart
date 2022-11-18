import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_error_widget.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_cubit.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_state.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/pages/favourites_coffee_images_page.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/widgets/favourite_coffee_image_widget.dart';

import '../../../../test_utils/make_testable_widget.dart';
import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';
import '../../../../test_utils/test_translations_getter.dart';

void main() {
  final mockCubit = FavouriteCoffeeImagesCubitMock();

  setUpAll(() {
    getIt.registerFactory<FavouriteCoffeeImagesCubit>(() => mockCubit);

    when(() => mockCubit.getFavouriteCoffeeImages()).thenAnswer((_) async {});
  });

  Future<void> prepareWidget(
    WidgetTester tester, {
    required FavouriteCoffeeImagesState state,
  }) async {
    whenListen(
      mockCubit,
      Stream.fromIterable([state]),
      initialState: state,
    );

    await tester.pumpWidget(makeTestableWidget(FavouriteCoffeeImagesPage()));
    await tester.pump();
  }

  testWidgets(
    'Should properly display loading state',
    (WidgetTester tester) async {
      await prepareWidget(tester, state: FavouriteCoffeeImagesState.loading());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'Should properly display error state',
    (WidgetTester tester) async {
      await prepareWidget(tester, state: FavouriteCoffeeImagesState.error());

      expect(find.byType(CoreErrorWidget), findsOneWidget);
    },
  );

  testWidgets(
    'Should properly display empty state',
    (WidgetTester tester) async {
      await prepareWidget(tester, state: FavouriteCoffeeImagesState.loaded([]));

      expect(
        find.text(testTranslations.favouritesEmptyStateTitle),
        findsOneWidget,
      );
      expect(
        find.text(testTranslations.favouritesEmptyStateBody),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Should properly display loaded state',
    (WidgetTester tester) async {
      await prepareWidget(
        tester,
        state: FavouriteCoffeeImagesState.loaded(tCoffeeImages),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(
        find.byType(FavouriteCoffeeImageWidget),
        findsNWidgets(tCoffeeImages.length),
      );
    },
  );
}
