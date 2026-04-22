import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab_5/main.dart';

void main() {
  testWidgets('Login success test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), 'user.valid123@email.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    await tester.tap(find.text('Login'));
    await tester.pump();
    expect(find.text('Login successful!'), findsOneWidget);
  });


  testWidgets('Login validation error test (invalid email format)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), 'invalid@email');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Invalid email format'), findsOneWidget);
  });


  testWidgets('Login validation error test (Empty email)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), '');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Invalid email format'), findsOneWidget);
  });


  testWidgets('Login validation error test (invalid password length)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), 'valid@email.com');
    await tester.enterText(find.byType(TextField).at(1), '123');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Password must be at least 6 characters'), findsOneWidget);
  });


  testWidgets('Login validation error test (Empty password)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), 'valid@email.com');
    await tester.enterText(find.byType(TextField).at(1), '');
    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('Password must be at least 6 characters'), findsOneWidget);
  });


  testWidgets('Slider changes value and updates text (50)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final sliderFinder = find.byType(Slider);
    expect(sliderFinder, findsOneWidget);
    expect(find.text('Slider Value: 20'), findsOneWidget);

    final rect = tester.getRect(sliderFinder);
    await tester.tapAt(Offset(rect.center.dx, rect.center.dy));
    await tester.pump();
    expect(find.text('Slider Value: 50'), findsOneWidget);
  });


  testWidgets('Slider changes value and updates text (100)', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final sliderFinder = find.byType(Slider);
    expect(sliderFinder, findsOneWidget);

    final rect = tester.getRect(sliderFinder);

    await tester.tapAt(Offset(rect.right - 4, rect.center.dy));
    await tester.pump();
    expect(find.text('Slider Value: 100'), findsOneWidget);
  });


 testWidgets('Slider changes value and updates text (0)', (WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());

  final sliderFinder = find.byType(Slider);
  expect(sliderFinder, findsOneWidget);

  final rect = tester.getRect(sliderFinder);

  await tester.tapAt(Offset(rect.left + 4, rect.center.dy));
  await tester.pump();

  expect(find.text('Slider Value: 0'), findsOneWidget);
});
}
