import 'package:flutter/material.dart';
import 'package:flutter_color_generation/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePage widget tests', () {
    testWidgets('Test if background color changes on tap', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      final originalBackgroundColor =
          tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final changedBackgroundColor =
          tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;
      expect(changedBackgroundColor, isNot(equals(originalBackgroundColor)));
    });

    testWidgets('Test if text color changes on double tap', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      final originalTextColor =
          tester.widget<Text>(find.byType(Text)).style?.color;
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      final changedTextColor =
          tester.widget<Text>(find.byType(Text)).style?.color;
      expect(changedTextColor, isNot(equals(originalTextColor)));
    });

    testWidgets('Test if screen splits on long press', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      final originalStackChildren =
          tester.widgetList<Align>(find.byType(Align)).length;
      await tester.longPress(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      final changedStackChildren =
          tester.widgetList<Align>(find.byType(Align)).length;
      expect(changedStackChildren, greaterThan(originalStackChildren));
    });
  });
}
