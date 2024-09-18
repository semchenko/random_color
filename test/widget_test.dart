import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color/main.dart';

void main() {
  testWidgets('ChangeableColors changes colors on tap', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ChangeableColors(),
    );

    // Function to get the current widget's color (need to create this method in
    // the widget for testing purposes)
    Color getBackgroundColor(WidgetTester tester) {
      final coloredBox = tester.widget<ColoredBox>(find.byType(ColoredBox));
      return coloredBox.color;
    }

    // Function to get the current text color (need to create this method in
    // the widget for testing purposes)
    Color getMessageColor(WidgetTester tester) {
      final text = tester.widget<Text>(find.byType(Text));
      return text.style?.color ?? Colors.transparent;
    }

    // Verify initial color
    final initialBackgroundColor = getBackgroundColor(tester);
    final initialMessageColor = getMessageColor(tester);

    // Tap the widget and trigger a rebuild
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Verify the color has changed
    expect(getBackgroundColor(tester), isNot(initialBackgroundColor));
    expect(getMessageColor(tester), isNot(initialMessageColor));
  });
}
