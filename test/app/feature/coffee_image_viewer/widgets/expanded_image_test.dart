import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/expanded_image.dart';

import '../../../../helpers/helpers.dart';

void main() {
  late MockCoffeeImageViewerBloc mockCoffeeImageViewerBloc;
  late MockCacheService mockCacheService;
  late MockFile mockFile;

  const imageUrl = 'http://test.com';

  setUpAll(() async {
    mockCoffeeImageViewerBloc = MockCoffeeImageViewerBloc();
    mockCacheService = MockCacheService();
    mockFile = MockFile();

    GetIt.I.registerSingleton<FileCacheService>(mockCacheService);
    GetIt.I.registerSingleton<CoffeeImageViewerBloc>(mockCoffeeImageViewerBloc);
    when(() => mockCoffeeImageViewerBloc.state)
        .thenReturn(const CoffeeImageViewerState());
    when(() => mockCoffeeImageViewerBloc.stream)
        .thenAnswer((_) => Stream.value(const CoffeeImageViewerState()));
    when(() => mockCacheService.getCachedFile(imageUrl))
        .thenAnswer((_) async => mockFile);
  });

  group('ExpandedImage', () {
    testWidgets('renders ExpandedImage', (tester) async {
      await tester.pumpApp(const ExpandedImage(imageUrl));
      expect(find.byType(ExpandedImage), findsOneWidget);
    });
  });
}
