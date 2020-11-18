// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_food_with_flutter/recipe_list.dart';
import 'package:test_food_with_flutter/recipes/constants.dart';
import 'package:test_food_with_flutter/recipes/tea.dart';
import 'package:test_food_with_flutter/recipes/tea_2.dart';
import 'package:test_food_with_flutter/recipes/tea_3.dart';

void main() {
  testWidgets('Find Recipes by Key', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RecipeList()));

    //Find By Text
    expect(find.text('Tea'), findsOneWidget);

    // Find By Key
    expect(find.byKey(Key('tea')), findsOneWidget);
  });

  Finder waterTextField, milkField, teaPowderField, sugarField, boilButton;
  group('Check Tea Recipes', () {
    setUpAll(() {
      waterTextField = find.byKey(Key('water'));
      milkField = find.byKey(Key('milk'));
      teaPowderField = find.byKey(Key('teaPowder'));
      sugarField = find.byKey(Key('sugar'));
      boilButton = find.widgetWithText(ElevatedButton, 'BOIL');
    });

    ///
    ///
    /// CHECK IF TEA INGREDIENTS ARE ALL ZERO IN THE BEGINNING
    ///
    ///
    ///

    testWidgets('Check If Tea Ingredients are All Zero',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipe()));

      expect(waterTextField, findsOneWidget);
      expect(waterController.text, '0');

      expect(milkField, findsOneWidget);
      expect(milkController.text, '0');

      expect(teaPowderField, findsOneWidget);
      expect(teaPowderController.text, '0');

      expect(sugarField, findsOneWidget);
      expect(sugarController.text, '0');
    });

    ///
    ///
    /// Check The Visibility of Output Message
    ///
    ///

    testWidgets('Check The Visibility of Output Message',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipe()));

      expect(find.byKey(Key('output')), findsNothing);

      expect(waterTextField, findsOneWidget);
      await tester.tap(waterTextField);
      await tester.pump();
      await tester.enterText(waterTextField, '1');

      expect(teaPowderField, findsOneWidget);
      await tester.tap(teaPowderField);
      await tester.pump();
      await tester.enterText(teaPowderField, '1');

      await tester.tap(boilButton);
      await tester.pumpAndSettle();

      expect(find.byKey(Key('output')), findsOneWidget);
    });

    ///
    ///
    /// CHECK IF TEA IS BLACK TEA!
    ///
    ///

    testWidgets('Check If Tea is Black Tea', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipe()));

      expect(waterTextField, findsOneWidget);
      await tester.tap(waterTextField);
      await tester.pump();
      await tester.enterText(waterTextField, '1');

      expect(teaPowderField, findsOneWidget);
      await tester.tap(teaPowderField);
      await tester.pump();
      await tester.enterText(teaPowderField, '1');

      await tester.tap(boilButton);
      await tester.pump();
      print(messageText);

      expect(find.text(ANS_BLACK_TEA), findsOneWidget);
    });

    ///
    ///
    /// CHECK IF TEA HAS TOO MUCH MILK
    ///
    ///

    testWidgets('Check If Tea Has Too Much Milk', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipe()));

      expect(waterTextField, findsOneWidget);
      await tester.tap(waterTextField);
      await tester.pump();
      await tester.enterText(waterTextField, '1');

      expect(teaPowderField, findsOneWidget);
      await tester.tap(teaPowderField);
      await tester.pump();
      await tester.enterText(teaPowderField, '1');

      expect(milkField, findsOneWidget);
      await tester.tap(milkField);
      await tester.pump();
      await tester.enterText(milkField, '5');

      expect(sugarField, findsOneWidget);
      expect(sugarController.text, SUGAR_ACTUAL,
          skip: "Sugar is skipped because it depends on preference");

      await tester.tap(boilButton);
      await tester.pump();
      print(messageText);

      expect(find.text(ANS_LIGHT_TEA), findsOneWidget);
    });

    testWidgets('Check If Tea is Black Tea & Boiled Properly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipeWithLongBoil()));

      expect(waterTextField, findsOneWidget);
      await tester.tap(waterTextField);
      await tester.pump();
      await tester.enterText(waterTextField, '1');

      expect(teaPowderField, findsOneWidget);
      await tester.tap(teaPowderField);
      await tester.pump();
      await tester.enterText(teaPowderField, '1');

      await tester.tap(boilButton);
      await tester.pumpAndSettle();

      expect(find.text(ANS_BLACK_TEA), findsOneWidget);
    });

    testWidgets('Scroll the list of ingredients and boil',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RecipeWithLongList()));
      Finder listView = find.byKey(Key('listView'));
      await tester.drag(listView, const Offset(0.0, -500));
      await tester.pump();

      await tester.ensureVisible(boilButton);
      await tester.tap(boilButton);
    });

    testWidgets('Check If Tea is Black Tea In a Smaller Screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipe()));
      // tester.binding.window.physicalSizeTestValue = Size(50, 50);
      // tester.binding.window.devicePixelRatioTestValue = 1.0;

      expect(waterTextField, findsOneWidget);
      await tester.tap(waterTextField);
      await tester.pump();
      await tester.enterText(waterTextField, '1');

      expect(teaPowderField, findsOneWidget);
      await tester.tap(teaPowderField);
      await tester.pump();
      await tester.enterText(teaPowderField, '1');

      await tester.tap(boilButton);
      await tester.pump();
      print(messageText);

      expect(find.text(ANS_BLACK_TEA), findsOneWidget);
    });

    testWidgets('Check if Tea is Inside a RecipeButton Widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RecipeList()));

      final buttonFinder = find.ancestor(
          of: find.text('Tea'), matching: find.byType(RecipeButton));

      expect(buttonFinder, findsOneWidget);
    });
  });
}
