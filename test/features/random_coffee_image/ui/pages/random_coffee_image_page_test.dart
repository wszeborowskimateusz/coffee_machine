import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_error_widget.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_cubit.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_state.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/pages/random_coffee_image_page.dart';

import '../../../../test_utils/make_testable_widget.dart';
import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final initialState = RandomCoffeeImageState.initial();
  final mockCubit = RandomCoffeeImageCubitMock();

  setUpAll(() {
    getIt.registerFactory<RandomCoffeeImageCubit>(() => mockCubit);

    when(() => mockCubit.generateNewRandomImages()).thenAnswer((_) async {});
  });

  Future<void> prepareWidget(
    WidgetTester tester, {
    required RandomCoffeeImageState state,
  }) async {
    whenListen(
      mockCubit,
      Stream.fromIterable([state]),
      initialState: state,
    );

    await tester.pumpWidget(makeTestableWidget(RandomCoffeeImagePage()));
    await tester.pump();
  }

  testWidgets(
    'Should properly display error state',
    (WidgetTester tester) async {
      await prepareWidget(
        tester,
        state: initialState.copyWith(status: RandomCoffeeImageStatus.error),
      );

      expect(find.byType(CoreErrorWidget), findsOneWidget);
    },
  );

  testWidgets(
    'Should properly display loading state',
    (WidgetTester tester) async {
      await prepareWidget(
        tester,
        state: initialState.copyWith(status: RandomCoffeeImageStatus.loading),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));
    },
  );

  testWidgets(
    'Should properly display loaded state',
    (WidgetTester tester) async {
      final matchEngine = MatchEngine(
        swipeItems: tCoffeeImages.map((e) => SwipeItem(content: e)).toList(),
      );

      await prepareWidget(
        tester,
        state: initialState.copyWith(
          status: RandomCoffeeImageStatus.loaded,
          randomCoffeeImages: tCoffeeImages,
          matchEngine: matchEngine,
        ),
      );

      expect(find.byType(SwipeCards), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));

      await tester.pump(const Duration(seconds: 1));
      matchEngine.dispose();
    },
  );
}
