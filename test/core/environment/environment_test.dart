import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/core/environment/dart_defines.dart';
import 'package:vgv_coffee_machine/core/environment/environment.dart';
import 'package:vgv_coffee_machine/core/services/dependency_injection/get_it.dart';

class _TestDartDefinesDev extends DartDefines {
  _TestDartDefinesDev() : super(Constants.environmentDev);
}

class _TestDartDefinesProd extends DartDefines {
  _TestDartDefinesProd() : super(Constants.environmentProd);
}

class _TestDartDefinesInvalid extends DartDefines {
  _TestDartDefinesInvalid() : super('Some invalid env');
}

void main() {
  setUpAll(() {
    getIt.allowReassignment = true;
  });

  tearDownAll(() {
    getIt.allowReassignment = false;
  });

  test('Should properly extract environment from dart defines: DEV', () {
    getIt.registerSingleton<DartDefines>(_TestDartDefinesDev());

    expect(EnvironmentConfig.init().currentEnvironment, Environment.dev);
  });

  test('Should properly extract environment from dart defines: PROD', () {
    getIt.registerSingleton<DartDefines>(_TestDartDefinesProd());

    expect(EnvironmentConfig.init().currentEnvironment, Environment.prod);
  });

  test('Should throw exception: invalid env', () {
    getIt.registerSingleton<DartDefines>(_TestDartDefinesInvalid());

    expect(() => EnvironmentConfig.init(), throwsArgumentError);
  });

  test('Should properly tells if env is dev', () {
    expect(const EnvironmentConfig(Environment.dev).isDev, isTrue);
    expect(const EnvironmentConfig(Environment.prod).isDev, isFalse);
  });

  test('Should properly tells if env is prod', () {
    expect(const EnvironmentConfig(Environment.dev).isProd, isFalse);
    expect(const EnvironmentConfig(Environment.prod).isProd, isTrue);
  });
}
