import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';

/// Helper widget to perform repetitive cubit tasks
///
/// It gets the proper cubit from getIt during initState
/// It closes the cubit on dispose (so cubit must be register as a factory or must be top level cubit)
///
/// When your widget requires widget state to declare things that need dispose
/// (like text field controllers), then you need to extend [CubitWidgetState]
/// and override [createState] function. You will receive this widget state
/// in [build] function
abstract class CubitWidget<C extends BlocBase<S>, S> extends StatefulWidget {
  void initState(C cubit) {}

  void listen(BuildContext context, C cubit, S state) {}

  Widget build(
    BuildContext context,
    C cubit,
    S state,
    CubitWidgetState widgetState,
  );

  @override
  State<CubitWidget> createState() => CubitWidgetState<C, S>();
}

class CubitWidgetState<C extends BlocBase<S>, S> extends State<CubitWidget> {
  late final C _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = getIt<C>();

    widget.initState(_cubit);
  }

  @override
  void dispose() async {
    super.dispose();
    await _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer(
        bloc: _cubit,
        builder: (context, state) => widget.build(context, _cubit, state, this),
        listener: (context, state) => widget.listen(context, _cubit, state),
      ),
    );
  }
}
