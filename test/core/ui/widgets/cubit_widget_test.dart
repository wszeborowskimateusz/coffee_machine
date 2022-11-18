import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/cubit_widget.dart';

import '../../../test_utils/make_testable_widget.dart';

class _TestCubit extends Cubit<int> {
  _TestCubit() : super(0);

  void updateState(int value) => emit(value);
}

bool _wasInitStateCalled = false;

class _TestWidget extends CubitWidget<_TestCubit, int> {
  @override
  void initState(_TestCubit cubit) {
    _wasInitStateCalled = true;
  }

  @override
  Widget build(BuildContext context, _TestCubit cubit, int state,
      CubitWidgetState<BlocBase, dynamic> widgetState) {
    return Text(state.toString());
  }
}

void main() {
  final _TestCubit testCubit = _TestCubit();

  setUpAll(() {
    getIt.registerFactory(() => testCubit);
  });

  testWidgets(
    'Should properly display cubit widget',
    (WidgetTester tester) async {
      final testableWidget = makeTestableWidget(_TestWidget());

      await tester.pumpWidget(testableWidget);
      await tester.pump();

      expect(find.text(0.toString()), findsOneWidget);
      expect(_wasInitStateCalled, isTrue);

      testCubit.updateState(1);
      await tester.pumpAndSettle();

      expect(find.text(1.toString()), findsOneWidget);
    },
  );
}
