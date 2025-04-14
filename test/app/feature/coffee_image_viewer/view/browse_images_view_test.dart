import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vg_coffee_app/app/core/connectivity/connectivity_cubit.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/bloc/coffee_image_bloc.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/view/browse_images_view.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/coffee_image.dart';
import '../../../../helpers/helpers.dart';

void main() {
  late MockCoffeeImageViewerBloc mockCoffeeImageViewerBloc;
  late MockConnectivityCubit mockConnectivityCubit;
  const imageUrl = 'http://test.com';

  setUp(() async {
    await GetIt.I.reset();

    HttpOverrides.global = null;

    mockCoffeeImageViewerBloc = MockCoffeeImageViewerBloc();
    mockConnectivityCubit = MockConnectivityCubit();
    GetIt.I.registerSingleton<CoffeeImageViewerBloc>(mockCoffeeImageViewerBloc);
    GetIt.I.registerSingleton<ConnectivityCubit>(mockConnectivityCubit);

    when(() => mockCoffeeImageViewerBloc.state).thenReturn(const CoffeeImageViewerState());
    when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(const CoffeeImageViewerState()));
    when(() => mockConnectivityCubit.state).thenReturn(true);
    when(() => mockConnectivityCubit.stream).thenAnswer((_) => Stream.value(true));
  });

  group('BrowseImagesView', () {
    testWidgets('renders BrowseImagesView', (tester) async {
      await tester.pumpApp(const BrowseImagesView());
      expect(find.byType(BrowseImagesView), findsOneWidget);
    });

    group('control widgets', () {
      testWidgets('shows correct favorite icon when image not favorited', (WidgetTester tester) async {
        const testState = CoffeeImageViewerState(
          images: [imageUrl],
        );

        when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
        when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));

        await tester.pumpApp(const BrowseImagesView());
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.favorite_outline), findsOneWidget);
      });
      testWidgets('shows correct favorite icon when image is favorited', (WidgetTester tester) async {
        const testState = CoffeeImageViewerState(
          images: [imageUrl],
          savedImages: [imageUrl],
        );

        when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
        when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));

        await tester.pumpApp(const BrowseImagesView());
        await tester.pumpAndSettle();
        //one extra for the bottom nav bar icon
        expect(find.byIcon(Icons.favorite), findsExactly(2));
      });

      testWidgets('hides favorite icon when image not loaded', (WidgetTester tester) async {
        const testState = CoffeeImageViewerState(
          images: [imageUrl],
          currentPage: 1,
        );

        when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
        when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));

        await tester.pumpApp(const BrowseImagesView());
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.favorite), findsOneWidget);
      });

      testWidgets('tapping next and previous buttons triggers page change events', (tester) async {
        const testState = CoffeeImageViewerState(
          images: [imageUrl, '$imageUrl/2'],
        );
        when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
        when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));

        await tester.pumpApp(const BrowseImagesView());
        await tester.pumpAndSettle();
        clearInteractions(mockCoffeeImageViewerBloc);

        final nextButtonFinder = find.byIcon(Icons.arrow_downward);
        expect(nextButtonFinder, findsOneWidget);
        await tester.tap(nextButtonFinder);
        await tester.pumpAndSettle();
        verify(() => mockCoffeeImageViewerBloc.add(const LoadImagesEvent(1))).called(1);

        final prevButtonFinder = find.byIcon(Icons.arrow_upward);
        expect(prevButtonFinder, findsOneWidget);
        await tester.tap(prevButtonFinder);
        await tester.pumpAndSettle();
        verify(() => mockCoffeeImageViewerBloc.add(const LoadImagesEvent(0))).called(1);
      });

      testWidgets('tapping on CoffeeImage triggers ToggleSaveImageEvent', (tester) async {
        const testState = CoffeeImageViewerState(
          images: [imageUrl],
        );
        when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
        when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));
        await tester.pumpApp(const BrowseImagesView());

        final coffeeImageFinder = find.byType(CoffeeImage);
        expect(coffeeImageFinder, findsOneWidget);

        await tester.tap(coffeeImageFinder);
        await tester.pump(const Duration(milliseconds: 50));
        await tester.tap(coffeeImageFinder);
        await tester.pumpAndSettle();
        verify(
          () => mockCoffeeImageViewerBloc.add(const ToggleSaveImageEvent(imageUrl)),
        ).called(1);
      });
    });

    group('Image display', () {
      testWidgets('shows progress indicator when image is loading', (tester) async {
        const testState = CoffeeImageViewerState(
          currentPage: 1,
        );
        when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
        when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));
        await tester.pumpApp(const BrowseImagesView());
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
      testWidgets('shows image when loaded', (tester) async {
        const testState = CoffeeImageViewerState(images: [imageUrl]);
        when(() => mockCoffeeImageViewerBloc.state).thenReturn(testState);
        when(() => mockCoffeeImageViewerBloc.stream).thenAnswer((_) => Stream.value(testState));
        await tester.pumpApp(const BrowseImagesView());
        await tester.pumpAndSettle();
        expect(find.byType(CoffeeImage), findsOneWidget);
      });
    });
    group('Connection status', () {
      testWidgets('shows no connection message when connectivity is false', (tester) async {
        const testConnectivity = false;
        when(() => mockConnectivityCubit.state).thenReturn(testConnectivity);
        await tester.pumpApp(const BrowseImagesView());
        expect(find.text('No connection'), findsOneWidget);
        expect(
          find.byIcon(Icons.signal_wifi_statusbar_connected_no_internet_4),
          findsOneWidget,
        );
      });

      testWidgets('does not show connection warning when connectivity is true', (tester) async {
        const testConnectivity = true;
        when(() => mockConnectivityCubit.state).thenReturn(testConnectivity);
        await tester.pumpApp(const BrowseImagesView());
        expect(find.text('No connection'), findsNothing);
        expect(
          find.byIcon(Icons.signal_wifi_statusbar_connected_no_internet_4),
          findsNothing,
        );
      });
    });
  });
}
