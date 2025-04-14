import 'package:file/file.dart' as file;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vg_coffee_app/app/core/connectivity/connectivity_cubit.dart';
import 'package:vg_coffee_app/app/core/data/repository/coffee_repo.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';

class MockCoffeeRepo extends Mock implements CoffeeRepo {}

class MockCacheService extends Mock implements FileCacheService {}

class MockFile extends Mock implements file.File {}

class MockStorage extends Mock implements Storage {}

class MockCoffeeImageViewerBloc extends Mock implements CoffeeImageViewerBloc {}

class MockConnectivityCubit extends Mock implements ConnectivityCubit {}
