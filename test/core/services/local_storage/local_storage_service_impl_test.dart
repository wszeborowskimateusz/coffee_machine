import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service.dart';
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service_impl.dart';

import '../../../test_utils/mocks.dart';

void main() {
  const String key = 'some key';

  final SharedPreferences sharedPreferencesMock = SharedPreferencesMock();
  late final LocalStorageService localStorageService;

  setUpAll(() {
    localStorageService = LocalStorageServiceImpl(sharedPreferencesMock);
  });

  group('getStringList', () {
    test('Should properly get the strings list when available', () {
      // Arrange
      final List<String> expectedList = ['a', 'b', 'c'];
      when(() => sharedPreferencesMock.getStringList(key))
          .thenReturn(expectedList);

      // Act
      final response = localStorageService.getStringList(key);

      // Assert
      expect(const ListEquality().equals(response, expectedList), isTrue);
      verify(() => sharedPreferencesMock.getStringList(key)).called(1);
    });

    test('Should return null when key is not present', () {
      // Arrange
      when(() => sharedPreferencesMock.getStringList(key)).thenReturn(null);

      // Act
      final response = localStorageService.getStringList(key);

      // Assert
      expect(response, isNull);
      verify(() => sharedPreferencesMock.getStringList(key)).called(1);
    });
  });

  group('saveStringList', () {
    test('Should properly call the shared preferences', () async {
      // Arrange
      final List<String> listToSave = ['a', 'b', 'c'];
      when(() => sharedPreferencesMock.setStringList(key, listToSave))
          .thenAnswer((_) async => true);

      // Act
      await localStorageService.saveStringList(key, listToSave);

      // Assert
      verify(() => sharedPreferencesMock.setStringList(key, listToSave))
          .called(1);
    });
  });

  group('getString', () {
    test('Should properly get the strings when available', () {
      // Arrange
      const String expectedValue = 'some value';
      when(() => sharedPreferencesMock.getString(key))
          .thenReturn(expectedValue);

      // Act
      final response = localStorageService.getString(key);

      // Assert
      expect(response, expectedValue);
      verify(() => sharedPreferencesMock.getString(key)).called(1);
    });

    test('Should return null when key is not present', () {
      // Arrange
      when(() => sharedPreferencesMock.getString(key)).thenReturn(null);

      // Act
      final response = localStorageService.getString(key);

      // Assert
      expect(response, isNull);
      verify(() => sharedPreferencesMock.getString(key)).called(1);
    });
  });

  group('saveString', () {
    test('Should properly call the shared preferences', () async {
      // Arrange
      const String valueToSave = 'some value';
      when(() => sharedPreferencesMock.setString(key, valueToSave))
          .thenAnswer((_) async => true);

      // Act
      await localStorageService.saveString(key, valueToSave);

      // Assert
      verify(() => sharedPreferencesMock.setString(key, valueToSave)).called(1);
    });
  });
}
