import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee_machine/core/services/dependency_injection/get_it.dart';

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
