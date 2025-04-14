import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vg_coffee_app/app/core/data/model/coffee_image.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';

import '../../../../helpers/helpers.dart';

void main() {
  late MockCoffeeRepo mockCoffeeRepo;
  late MockCacheService mockCacheService;
  late MockFile mockFile;

  setUp(() {
    GetIt.I.reset();

    initHydratedStorage();
    mockCoffeeRepo = MockCoffeeRepo();
    mockCacheService = MockCacheService();
    mockFile = MockFile();

    GetIt.I.registerSingleton<FileCacheService>(mockCacheService);
    when(() => mockCoffeeRepo.getCoffeeImage()).thenAnswer((_) async => const CoffeeImage(file: 'test'));
    when(() => mockCacheService.cacheFile('test')).thenAnswer((_) async => mockFile);
    when(() => mockCacheService.removeFile('test')).thenAnswer((_) async {});
  });

  group('CoffeeImageViewerBloc', () {
    group('loadImagesEvent', () {
      blocTest<CoffeeImageViewerBloc, CoffeeImageViewerState>(
        'emits states with loaded images and computed imageWindow on bloc initialization at page 0',
        build: () => CoffeeImageViewerBloc(mockCoffeeRepo, mockCacheService),
        act: (bloc) => bloc.add(const CoffeeImageViewerEvent.loadImagesEvent(0)),
        expect: () => [
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', true)
              .having((s) => s.currentPage, 'currentPage', 0)
              .having((s) => s.errorMessage, 'errorMessage', null),
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', true)
              .having((s) => s.currentPage, 'currentPage', 0)
              .having((s) => s.images.length, 'images loaded', 5)
              .having((s) => s.imageWindow.isEmpty, 'imageWindow is empty initially', true),
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', false)
              .having((s) => s.currentPage, 'currentPage', 0)
              .having((s) => s.images.length, 'total images', 5)
              .having((s) => s.imageWindow, 'imageWindow', equals({0, 1, 2, 3, 4})),
        ],
      );
      blocTest<CoffeeImageViewerBloc, CoffeeImageViewerState>(
        'emits states with loaded images and computed imageWindow when current page is 20',
        build: () => CoffeeImageViewerBloc(mockCoffeeRepo, mockCacheService),
        seed: () => CoffeeImageViewerState(
          currentPage: 5,
          imageWindow: {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
          images: List.generate(
            10,
            (index) => 'test',
          ),
        ),
        act: (bloc) => bloc.add(const CoffeeImageViewerEvent.loadImagesEvent(20)),
        expect: () => [
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', true)
              .having((s) => s.currentPage, 'currentPage', 20)
              .having((s) => s.errorMessage, 'errorMessage', null),
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', true)
              .having((s) => s.currentPage, 'currentPage', 20)
              .having((s) => s.images.length, 'images loaded', 25),
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', false)
              .having((s) => s.currentPage, 'currentPage', 20)
              .having((s) => s.images.length, 'total images', 25)
              .having((s) => s.imageWindow, 'imageWindow', equals({15, 16, 17, 18, 19, 20, 21, 22, 23, 24})),
        ],
      );
      blocTest<CoffeeImageViewerBloc, CoffeeImageViewerState>(
        'emits error state when getCoffeeImage throws an exception',
        build: () {
          when(() => mockCoffeeRepo.getCoffeeImage()).thenThrow(Exception('error loading image'));
          return CoffeeImageViewerBloc(mockCoffeeRepo, mockCacheService);
        },
        act: (bloc) => bloc.add(const CoffeeImageViewerEvent.loadImagesEvent(0)),
        expect: () => [
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', true)
              .having((s) => s.currentPage, 'currentPage', 0)
              .having((s) => s.errorMessage, 'errorMessage', null),
          isA<CoffeeImageViewerState>()
              .having((s) => s.loadingImage, 'loadingImage', false)
              .having((s) => s.errorMessage, 'errorMessage', 'Failed to load image'),
        ],
      );
    });

    group('toggleSaveImageEvent', () {
      blocTest<CoffeeImageViewerBloc, CoffeeImageViewerState>(
        'adds image URL to savedImages when it is not already saved',
        build: () => CoffeeImageViewerBloc(mockCoffeeRepo, mockCacheService),
        act: (bloc) => bloc.add(const CoffeeImageViewerEvent.toggleSaveImageEvent('test')),
        expect: () => [
          isA<CoffeeImageViewerState>().having((s) => s.savingImage, 'savingImage', true),
          isA<CoffeeImageViewerState>()
              .having((s) => s.savingImage, 'savingImage', false)
              .having((s) => s.savedImages, 'savedImages', contains('test')),
        ],
      );

      blocTest<CoffeeImageViewerBloc, CoffeeImageViewerState>(
        'removes image URL from savedImages when it is already saved',
        build: () => CoffeeImageViewerBloc(mockCoffeeRepo, mockCacheService),
        seed: () => const CoffeeImageViewerState(savedImages: ['test']),
        act: (bloc) => bloc.add(const CoffeeImageViewerEvent.toggleSaveImageEvent('test')),
        expect: () => [
          isA<CoffeeImageViewerState>().having((s) => s.savingImage, 'savingImage', true),
          isA<CoffeeImageViewerState>()
              .having((s) => s.savingImage, 'savingImage', false)
              .having((s) => s.savedImages, 'savedImages', isEmpty),
        ],
      );
      blocTest<CoffeeImageViewerBloc, CoffeeImageViewerState>(
        'emits error state when getSingleFile throws an exception',
        build: () {
          when(() => mockCacheService.cacheFile('url_error')).thenThrow(Exception('error saving image'));
          return CoffeeImageViewerBloc(mockCoffeeRepo, mockCacheService);
        },
        act: (bloc) => bloc.add(const CoffeeImageViewerEvent.toggleSaveImageEvent('url_error')),
        expect: () => [
          isA<CoffeeImageViewerState>().having((s) => s.savingImage, 'savingImage', true),
          isA<CoffeeImageViewerState>()
              .having((s) => s.savingImage, 'savingImage', false)
              .having((s) => s.errorMessage, 'errorMessage', 'Failed to update toggle image save'),
        ],
      );
      blocTest<CoffeeImageViewerBloc, CoffeeImageViewerState>(
        'emits error state when removeFile throws an exception',
        build: () {
          when(() => mockCacheService.removeFile('url_error')).thenThrow(Exception('error removing image'));
          return CoffeeImageViewerBloc(mockCoffeeRepo, mockCacheService);
        },
        seed: () => const CoffeeImageViewerState(savedImages: ['url_error']),
        act: (bloc) => bloc.add(const CoffeeImageViewerEvent.toggleSaveImageEvent('url_error')),
        expect: () => [
          isA<CoffeeImageViewerState>().having((s) => s.savingImage, 'savingImage', true),
          isA<CoffeeImageViewerState>()
              .having((s) => s.savingImage, 'savingImage', false)
              .having((s) => s.errorMessage, 'errorMessage', 'Failed to update toggle image save'),
        ],
      );
    });
  });
}
