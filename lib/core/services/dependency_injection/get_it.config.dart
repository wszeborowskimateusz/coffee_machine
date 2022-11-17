// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:vgv_coffee_machine/core/environment/environment.dart' as _i4;
import 'package:vgv_coffee_machine/core/services/core_services.dart' as _i30;
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service.dart'
    as _i11;
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service_impl.dart'
    as _i12;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source.dart'
    as _i18;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source_impl.dart'
    as _i19;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/repositories/favourite_coffee_images_repository_impl.dart'
    as _i21;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart'
    as _i20;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_stream_use_case.dart'
    as _i22;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_use_case.dart'
    as _i23;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/save_coffee_image_as_favourite_use_case.dart'
    as _i25;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/unsave_coffee_image_from_favourites_use_case.dart'
    as _i26;
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_cubit.dart'
    as _i28;
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source.dart'
    as _i5;
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source_impl.dart'
    as _i6;
import 'package:vgv_coffee_machine/features/random_coffee_image/data/repositories/random_coffee_image_repository_impl.dart'
    as _i8;
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/repositories/random_coffee_image_repository.dart'
    as _i7;
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/use_cases/get_random_coffee_image_use_case.dart'
    as _i10;
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_cubit.dart'
    as _i29;
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source.dart'
    as _i13;
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source_impl.dart'
    as _i14;
import 'package:vgv_coffee_machine/features/settings/data/repositories/settings_repository_impl.dart'
    as _i16;
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart'
    as _i15;
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/change_theme_mode_use_case.dart'
    as _i17;
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/get_saved_theme_mode_use_case.dart'
    as _i24;
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart'
    as _i27; // ignore_for_file: unnecessary_lambdas

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
  final coreServices = _$CoreServices();
  gh.factory<_i3.Dio>(() => coreServices.dio);
  gh.singleton<_i4.EnvironmentConfig>(_i4.EnvironmentConfig());
  gh.lazySingleton<_i5.RandomCoffeeImageRemoteDataSource>(
      () => _i6.RandomCoffeeImageRemoteDataSourceImpl(get<_i3.Dio>()));
  gh.singleton<_i7.RandomCoffeeImageRepository>(
      _i8.RandomCoffeeImageRepositoryImpl(
          get<_i5.RandomCoffeeImageRemoteDataSource>()));
  await gh.factoryAsync<_i9.SharedPreferences>(
    () => coreServices.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i10.GetRandomCoffeeImageUseCase>(() =>
      _i10.GetRandomCoffeeImageUseCase(get<_i7.RandomCoffeeImageRepository>()));
  gh.singleton<_i11.LocalStorageService>(
      _i12.LocalStorageServiceImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i13.SettingsLocalDataSource>(
      () => _i14.SettingsLocalDataSourceImpl(get<_i11.LocalStorageService>()));
  gh.lazySingleton<_i15.SettingsRepository>(
      () => _i16.SettingsRepositoryImpl(get<_i13.SettingsLocalDataSource>()));
  gh.lazySingleton<_i17.ChangeThemeModeUseCase>(
      () => _i17.ChangeThemeModeUseCase(get<_i15.SettingsRepository>()));
  gh.lazySingleton<_i18.FavouriteCoffeeImagesLocalDataSource>(() =>
      _i19.FavouriteCoffeeImagesLocalDataSourceImpl(
          get<_i11.LocalStorageService>()));
  gh.lazySingleton<_i20.FavouriteCoffeeImagesRepository>(() =>
      _i21.FavouriteCoffeeImagesRepositoryImpl(
          get<_i18.FavouriteCoffeeImagesLocalDataSource>()));
  gh.lazySingleton<_i22.GetFavouriteCoffeeImagesStreamUseCase>(() =>
      _i22.GetFavouriteCoffeeImagesStreamUseCase(
          get<_i20.FavouriteCoffeeImagesRepository>()));
  gh.lazySingleton<_i23.GetFavouriteCoffeeImagesUseCase>(() =>
      _i23.GetFavouriteCoffeeImagesUseCase(
          get<_i20.FavouriteCoffeeImagesRepository>()));
  gh.lazySingleton<_i24.GetSavedThemeModeUseCase>(
      () => _i24.GetSavedThemeModeUseCase(get<_i15.SettingsRepository>()));
  gh.lazySingleton<_i25.SaveCoffeeImageAsFavouriteUseCase>(() =>
      _i25.SaveCoffeeImageAsFavouriteUseCase(
          get<_i20.FavouriteCoffeeImagesRepository>()));
  gh.lazySingleton<_i26.UnsaveCoffeeImageFromFavouritesUseCase>(() =>
      _i26.UnsaveCoffeeImageFromFavouritesUseCase(
          get<_i20.FavouriteCoffeeImagesRepository>()));
  gh.singleton<_i27.AppThemeCubit>(_i27.AppThemeCubit(
    get<_i24.GetSavedThemeModeUseCase>(),
    get<_i17.ChangeThemeModeUseCase>(),
  ));
  gh.factory<_i28.FavouriteCoffeeImagesCubit>(
      () => _i28.FavouriteCoffeeImagesCubit(
            get<_i23.GetFavouriteCoffeeImagesUseCase>(),
            get<_i26.UnsaveCoffeeImageFromFavouritesUseCase>(),
            get<_i22.GetFavouriteCoffeeImagesStreamUseCase>(),
          ));
  gh.factory<_i29.RandomCoffeeImageCubit>(() => _i29.RandomCoffeeImageCubit(
        get<_i10.GetRandomCoffeeImageUseCase>(),
        get<_i25.SaveCoffeeImageAsFavouriteUseCase>(),
      ));
  return get;
}

class _$CoreServices extends _i30.CoreServices {}
