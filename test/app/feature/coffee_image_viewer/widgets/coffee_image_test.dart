import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vg_coffee_app/app/feature/coffee_image_viewer/widgets/coffee_image.dart';

import '../../../../helpers/helpers.dart';

void main() {
  testWidgets('CoffeeImage initial state shows heart with opacity 0',
      (WidgetTester tester) async {
    bool onTapCalled = false;
    await tester.pumpApp(
      CoffeeImage(
        onTap: () {
          onTapCalled = true;
        },
        child: const SizedBox.shrink(),
      ),
    );
    await tester.pumpAndSettle();
    final animatedOpacity =
        tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity));
    expect(animatedOpacity.opacity, equals(0.0));
    expect(onTapCalled, isFalse);
  });

  testWidgets('CoffeeImage double tap triggers onTap and shows heart',
      (WidgetTester tester) async {
    bool onTapCalled = false;
    await tester.pumpApp(
      CoffeeImage(
        onTap: () {
          onTapCalled = true;
        },
        child: const SizedBox.shrink(),
      ),
    );
    await tester.pumpAndSettle();
    final coffeeImageFinder = find.byType(CoffeeImage);
    await tester.tap(coffeeImageFinder);
    await tester.pump(const Duration(milliseconds: 50));
    await tester.tap(coffeeImageFinder);
    await tester.pump();
    expect(onTapCalled, isTrue);
    var animatedOpacity =
        tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity));
    expect(animatedOpacity.opacity, equals(1.0));
    await tester.pump(const Duration(milliseconds: 300));
    animatedOpacity =
        tester.widget<AnimatedOpacity>(find.byType(AnimatedOpacity));
    expect(animatedOpacity.opacity, equals(0.0));
  });
}
