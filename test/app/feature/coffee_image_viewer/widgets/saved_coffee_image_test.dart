import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/saved_coffee_image.dart';

import '../../../../helpers/helpers.dart';

void main() {
  late MockCoffeeImageViewerBloc mockCoffeeImageViewerBloc;
  late MockCacheService mockCacheService;
  late MockFile mockFile;

  const imageUrl = 'http://test.com';

  setUp(() async {
    await GetIt.I.reset();

    mockCoffeeImageViewerBloc = MockCoffeeImageViewerBloc();
    mockCacheService = MockCacheService();
    mockFile = MockFile();

    GetIt.I.registerSingleton<FileCacheService>(mockCacheService);
    GetIt.I.registerSingleton<CoffeeImageViewerBloc>(mockCoffeeImageViewerBloc);
    when(() => mockCacheService.cacheFile(imageUrl))
        .thenAnswer((_) async => mockFile);
    when(() => mockCacheService.getCachedFile(imageUrl))
        .thenAnswer((_) async => mockFile);
    when(() => mockCacheService.removeFile(imageUrl)).thenAnswer((_) async {});
  });

  group('SavedCoffeeImage', () {
    testWidgets('renders SavedCoffeeImage', (tester) async {
      await tester.pumpApp(const SavedCoffeeImage(imageUrl));
      expect(find.byType(SavedCoffeeImage), findsOneWidget);
    });
    testWidgets('tapping remove icon triggers ToggleSaveImageEvent',
        (tester) async {
      await tester.pumpApp(const SavedCoffeeImage(imageUrl));
      final removeButtonFinder = find.byIcon(Icons.remove_circle_outline);
      expect(removeButtonFinder, findsOneWidget);
      await tester.tap(removeButtonFinder);
      verify(
        () =>
            mockCoffeeImageViewerBloc.add(const ToggleSaveImageEvent(imageUrl)),
      ).called(1);
    });
  });
}
