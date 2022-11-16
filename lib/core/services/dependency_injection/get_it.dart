import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/services/dependency_injection/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureDependencies() => $initGetIt(getIt);
