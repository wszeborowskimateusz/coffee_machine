import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_coffee_machine/core/services/logging/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    Log.info('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Log.error('onError(${bloc.runtimeType})', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
