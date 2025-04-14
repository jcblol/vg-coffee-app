// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hydrated_bloc/hydrated_bloc.dart' as _i67;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/coffee_image_viewer/bloc/coffee_image_bloc.dart' as _i264;
import '../connectivity/connectivity_cubit.dart' as _i690;
import '../data/api/api.dart' as _i834;
import '../data/api/rest_client.dart' as _i328;
import '../data/repository/coffee_repo.dart' as _i789;
import '../service/image_cache_service.dart' as _i417;
import 'modules/hydrated_bloc_module.dart' as _i795;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hydratedBlocModule = _$HydratedBlocModule();
    await gh.factoryAsync<_i67.HydratedStorage>(
      () => hydratedBlocModule.init(),
      preResolve: true,
    );
    gh.singleton<_i690.ConnectivityCubit>(() => _i690.ConnectivityCubit());
    gh.singleton<_i328.RestClient>(() => _i328.RestClient());
    gh.singleton<_i417.FileCacheService>(() => _i417.FileCacheService());
    gh.singleton<_i834.API>(() => _i834.API(gh<_i328.RestClient>()));
    gh.lazySingleton<_i789.CoffeeRepo>(() => _i789.CoffeeRepo(gh<_i834.API>()));
    gh.singleton<_i264.CoffeeImageViewerBloc>(() => _i264.CoffeeImageViewerBloc(
          gh<_i789.CoffeeRepo>(),
          gh<_i417.FileCacheService>(),
        ));
    return this;
  }
}

class _$HydratedBlocModule extends _i795.HydratedBlocModule {}
