import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_stream_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/save_coffee_image_as_favourite_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/unsave_coffee_image_from_favourites_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_cubit.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_state.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/repositories/random_coffee_image_repository.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/use_cases/get_random_coffee_image_use_case.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_cubit.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_state.dart';
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/change_theme_mode_use_case.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/get_saved_theme_mode_use_case.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

class LocalStorageServiceMock extends Mock implements LocalStorageService {}

class DioMock extends Mock implements Dio {}

class FavouriteCoffeeImagesLocalDataSourceMock extends Mock
    implements FavouriteCoffeeImagesLocalDataSource {}

class RandomCoffeeImageRepositoryMock extends Mock
    implements RandomCoffeeImageRepository {}

class SettingsLocalDataSourceMock extends Mock
    implements SettingsLocalDataSource {}

class RandomCoffeeImageRemoteDataSourceMock extends Mock
    implements RandomCoffeeImageRemoteDataSource {}

class FavouriteCoffeeImagesRepositoryMock extends Mock
    implements FavouriteCoffeeImagesRepository {}

class GetFavouriteCoffeeImagesUseCaseMock extends Mock
    implements GetFavouriteCoffeeImagesUseCase {}

class SettingsRepositoryMock extends Mock implements SettingsRepository {}

class GetSavedThemeModeUseCaseMock extends Mock
    implements GetSavedThemeModeUseCase {}

class ChangeThemeModeUseCaseMock extends Mock
    implements ChangeThemeModeUseCase {}

class GetRandomCoffeeImageUseCaseMock extends Mock
    implements GetRandomCoffeeImageUseCase {}

class SaveCoffeeImageAsFavouriteUseCaseMock extends Mock
    implements SaveCoffeeImageAsFavouriteUseCase {}

class UnsaveCoffeeImageFromFavouritesUseCaseMock extends Mock
    implements UnsaveCoffeeImageFromFavouritesUseCase {}

class GetFavouriteCoffeeImagesStreamUseCaseMock extends Mock
    implements GetFavouriteCoffeeImagesStreamUseCase {}

class RandomCoffeeImageCubitMock extends MockCubit<RandomCoffeeImageState>
    implements RandomCoffeeImageCubit {}

class FavouriteCoffeeImagesCubitMock
    extends MockCubit<FavouriteCoffeeImagesState>
    implements FavouriteCoffeeImagesCubit {}

class AppThemeCubitMock extends MockCubit<CustomThemeMode>
    implements AppThemeCubit {}
