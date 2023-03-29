// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'package:counter/main.dart';

void main() {
  patrolTest(
    'counter is incremented when plus button is tapped',
    nativeAutomation: true,
    (PatrolTester $) async {
      await $.pumpWidget(const MyApp());

      expect($('0'), findsOneWidget);
      expect($('-1'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 5));
      await $(Icons.add).tap();

      expect($('0'), findsNothing);
      expect($('1'), findsOneWidget);
    },
  );
}
