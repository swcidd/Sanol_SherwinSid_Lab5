// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sanol_sherwinsid_lab5/main.dart';

void main() {
  testWidgets('Membership card screen renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Club Membership Card'), findsOneWidget);
    expect(find.text('CPU'), findsOneWidget);
    expect(find.text('MEMBER NAME'), findsOneWidget);
    expect(find.text('Open Organization Page'), findsOneWidget);
  });
}
