import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vg_coffee_app/app/core/connectivity/connectivity_cubit.dart';
import 'package:vg_coffee_app/app/core/service/image_cache_service.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/view/saved_images_view.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/saved_coffee_image.dart';
import '../../../../helpers/helpers.dart';

void main() {
  late MockCoffeeImageViewerBloc mockCoffeeImageViewerBloc;
  late MockConnectivityCubit mockConnectivityCubit;
  late MockCacheService mockCacheService;
  late MockFile mockFile;

  const imageUrl = 'http://test.com';

  setUpAll(() async {
    HttpOverrides.global = null;
    mockFile = MockFile();
    mockCacheService = MockCacheService();
    mockCoffeeImageViewerBloc = MockCoffeeImageViewerBloc();
    mockConnectivityCubit = MockConnectivityCubit();
    GetIt.I.registerSingleton<FileCacheService>(mockCacheService);
    GetIt.I.registerSingleton<CoffeeImageViewerBloc>(mockCoffeeImageViewerBloc);
    GetIt.I.registerSingleton<ConnectivityCubit>(mockConnectivityCubit);

    when(() => mockCoffeeImageViewerBloc.state).thenReturn(const CoffeeImageViewerState());
    when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(const CoffeeImageViewerState()));
    when(() => mockConnectivityCubit.state).thenReturn(true);
    when(() => mockConnectivityCubit.stream).thenAnswer((_) => Stream.value(true));
    when(() => mockCacheService.getCachedFile(imageUrl)).thenAnswer((_) async => mockFile);
    when(() => mockCacheService.getCachedFile('$imageUrl/2')).thenAnswer((_) async => mockFile);
  });

  group('SavedImagesView', () {
    testWidgets('renders SavedImagesView', (tester) async {
      await tester.pumpApp(const SavedImagesView());
      expect(find.byType(SavedImagesView), findsOneWidget);
    });
    testWidgets('shows "No saved images" when there are no saved images', (tester) async {
      when(() => mockCoffeeImageViewerBloc.state).thenReturn(const CoffeeImageViewerState());
      when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(const CoffeeImageViewerState()));
      await tester.pumpApp(const SavedImagesView());
      await tester.pumpAndSettle();
      expect(find.text('No saved images'), findsOneWidget);
      expect(find.byType(GridView), findsNothing);
    });

    testWidgets('displays GridView with SavedCoffeeImage when saved images exist', (tester) async {
      const testState = CoffeeImageViewerState(savedImages: [imageUrl, '$imageUrl/2']);
      when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
      when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));
      when(() => mockConnectivityCubit.state).thenReturn(true);
      when(() => mockConnectivityCubit.stream).thenAnswer((_) => Stream.value(true));
      await tester.pumpApp(const SavedImagesView());
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(SavedCoffeeImage), findsNWidgets(2));
    });
  });
}
