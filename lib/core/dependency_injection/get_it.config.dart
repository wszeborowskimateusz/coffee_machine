// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart'
    as _i31;
import 'package:vgv_coffee_machine/core/environment/dart_defines.dart' as _i3;
import 'package:vgv_coffee_machine/core/environment/environment.dart' as _i5;
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service.dart'
    as _i12;
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service_impl.dart'
    as _i13;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source.dart'
    as _i19;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source_impl.dart'
    as _i20;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/repositories/favourite_coffee_images_repository_impl.dart'
    as _i22;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart'
    as _i21;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_stream_use_case.dart'
    as _i23;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_use_case.dart'
    as _i24;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/save_coffee_image_as_favourite_use_case.dart'
    as _i26;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/unsave_coffee_image_from_favourites_use_case.dart'
    as _i27;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_cubit.dart'
    as _i29;
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source.dart'
    as _i6;
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source_impl.dart'
    as _i7;
import 'package:vgv_coffee_machine/features/random_coffee_image/data/repositories/random_coffee_image_repository_impl.dart'
    as _i9;
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/repositories/random_coffee_image_repository.dart'
    as _i8;
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/use_cases/get_random_coffee_image_use_case.dart'
    as _i11;
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_cubit.dart'
    as _i30;
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source.dart'
    as _i14;
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source_impl.dart'
    as _i15;
import 'package:vgv_coffee_machine/features/settings/data/repositories/settings_repository_impl.dart'
    as _i17;
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart'
    as _i16;
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/change_theme_mode_use_case.dart'
    as _i18;
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/get_saved_theme_mode_use_case.dart'
    as _i25;
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart'
    as _i28; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final coreExternalServices = _$CoreExternalServices();
  gh.singleton<_i3.DartDefines>(_i3.DartDefines.init());
  gh.factory<_i4.Dio>(() => coreExternalServices.dio);
  gh.singleton<_i5.EnvironmentConfig>(_i5.EnvironmentConfig.init());
  gh.lazySingleton<_i6.RandomCoffeeImageRemoteDataSource>(
      () => _i7.RandomCoffeeImageRemoteDataSourceImpl(get<_i4.Dio>()));
  gh.singleton<_i8.RandomCoffeeImageRepository>(
      _i9.RandomCoffeeImageRepositoryImpl(
          get<_i6.RandomCoffeeImageRemoteDataSource>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => coreExternalServices.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i11.GetRandomCoffeeImageUseCase>(() =>
      _i11.GetRandomCoffeeImageUseCase(get<_i8.RandomCoffeeImageRepository>()));
  gh.singleton<_i12.LocalStorageService>(
      _i13.LocalStorageServiceImpl(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i14.SettingsLocalDataSource>(
      () => _i15.SettingsLocalDataSourceImpl(get<_i12.LocalStorageService>()));
  gh.lazySingleton<_i16.SettingsRepository>(
      () => _i17.SettingsRepositoryImpl(get<_i14.SettingsLocalDataSource>()));
  gh.lazySingleton<_i18.ChangeThemeModeUseCase>(
      () => _i18.ChangeThemeModeUseCase(get<_i16.SettingsRepository>()));
  gh.lazySingleton<_i19.FavouriteCoffeeImagesLocalDataSource>(() =>
      _i20.FavouriteCoffeeImagesLocalDataSourceImpl(
          get<_i12.LocalStorageService>()));
  gh.lazySingleton<_i21.FavouriteCoffeeImagesRepository>(() =>
      _i22.FavouriteCoffeeImagesRepositoryImpl(
          get<_i19.FavouriteCoffeeImagesLocalDataSource>()));
  gh.lazySingleton<_i23.GetFavouriteCoffeeImagesStreamUseCase>(() =>
      _i23.GetFavouriteCoffeeImagesStreamUseCase(
          get<_i21.FavouriteCoffeeImagesRepository>()));
  gh.lazySingleton<_i24.GetFavouriteCoffeeImagesUseCase>(() =>
      _i24.GetFavouriteCoffeeImagesUseCase(
          get<_i21.FavouriteCoffeeImagesRepository>()));
  gh.lazySingleton<_i25.GetSavedThemeModeUseCase>(
      () => _i25.GetSavedThemeModeUseCase(get<_i16.SettingsRepository>()));
  gh.lazySingleton<_i26.SaveCoffeeImageAsFavouriteUseCase>(() =>
      _i26.SaveCoffeeImageAsFavouriteUseCase(
          get<_i21.FavouriteCoffeeImagesRepository>()));
  gh.lazySingleton<_i27.UnsaveCoffeeImageFromFavouritesUseCase>(() =>
      _i27.UnsaveCoffeeImageFromFavouritesUseCase(
          get<_i21.FavouriteCoffeeImagesRepository>()));
  gh.singleton<_i28.AppThemeCubit>(_i28.AppThemeCubit(
    get<_i25.GetSavedThemeModeUseCase>(),
    get<_i18.ChangeThemeModeUseCase>(),
  ));
  gh.factory<_i29.FavouriteCoffeeImagesCubit>(
      () => _i29.FavouriteCoffeeImagesCubit(
            get<_i24.GetFavouriteCoffeeImagesUseCase>(),
            get<_i27.UnsaveCoffeeImageFromFavouritesUseCase>(),
            get<_i23.GetFavouriteCoffeeImagesStreamUseCase>(),
          ));
  gh.factory<_i30.RandomCoffeeImageCubit>(() => _i30.RandomCoffeeImageCubit(
        get<_i11.GetRandomCoffeeImageUseCase>(),
        get<_i26.SaveCoffeeImageAsFavouriteUseCase>(),
      ));
  return get;
}

class _$CoreExternalServices extends _i31.CoreExternalServices {}
