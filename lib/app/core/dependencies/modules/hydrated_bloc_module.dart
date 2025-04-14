import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class HydratedBlocModule {
  @preResolve
  Future<HydratedStorage> init() async {
    return HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory:
          kIsWeb ? HydratedStorageDirectory.web : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }
}
