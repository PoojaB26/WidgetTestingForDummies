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
  ///
  ///
  /// EMPTY TEST
  ///
  ///
  testWidgets('Dummy Test', (WidgetTester tester) async {
    //
  });

  ///
  ///
  /// VERIFY IF RECIPE [TEA] IS PART OF THE RECIPE LIST
  ///
  ///

  testWidgets('Find Recipes by Key', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RecipeList()));

    // await tester
    //     .pumpWidget(Directionality(
    //     textDirection: TextDirection.ltr,
    //     child: MediaQuery(data: MediaQueryData(), child: RecipeList())));

    //Find By Text
    expect(find.text('Tea'), findsOneWidget);

    // Find By Key
    expect(find.byKey(Key('tea')), findsOneWidget);
  });

  ///
  ///
  /// TEA RECIPE GROUP!
  ///
  ///

  Finder waterTextField, milkField, teaPowderField, sugarField, boilButton;
  group('Verify it is the best tea in the world.', () {
    //
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
    /// SETUP INGREDIENTS:
    ///
    ///
    setUp(() {
      waterTextField = find.byKey(Key('water'));
      milkField = find.byKey(Key('milk'));
      teaPowderField = find.byKey(Key('teaPowder'));
      sugarField = find.byKey(Key('sugar'));
      boilButton = find.widgetWithText(ElevatedButton, 'BOIL');
    });

    ///
    ///
    /// VERIFY IF TEA INGREDIENTS ARE ALL ZERO IN THE BEGINNING
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
    /// VERIFY IF TEA IS BLACK TEA!
    ///
    ///

    testWidgets('Verify If Tea is Black Tea', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipe()));

      expect(waterTextField, findsOneWidget);
      await tester.tap(waterTextField);
      await tester.pump();
      await tester.enterText(waterTextField, '1');
      //
      expect(teaPowderField, findsOneWidget);
      await tester.tap(teaPowderField);
      await tester.pump();
      await tester.enterText(teaPowderField, '1');
      //
      await tester.tap(boilButton);
      await tester.pump();
      print(messageText);
      //
      expect(find.text(ANS_BLACK_TEA), findsOneWidget);
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
      await tester.pump();

      expect(find.byKey(Key('output')), findsOneWidget);
    });

    ///
    ///
    /// VERIFY IF ITS A PERFECT MILK TEA!
    ///
    ///

    testWidgets('Verify it is a perfect milk tea!',
        (WidgetTester tester) async {
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
      await tester.enterText(milkField, '3.4');

      expect(sugarField, findsOneWidget);
      expect(sugarController.text, SUGAR_ACTUAL,
          skip: "Sugar is skipped because it depends on preference");
      //
      await tester.tap(boilButton);
      await tester.pump();
      // print(messageText);
      //
      expect(find.text(ANS_PERFECT_MILK_TEA), findsOneWidget);
    });

    ///
    ///
    /// VERIFY TEA IS BLACK AND BOILED PROPERLY!
    ///
    ///

    testWidgets('Verify If Tea is Black Tea & Boiled Properly',
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

    ///
    ///
    /// VERIFY APP WORKS IN A SMALLER SCREEN
    ///
    ///

    testWidgets('Check If Tea is Black Tea In a Smaller Screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TeaRecipe()));
      tester.binding.window.physicalSizeTestValue = Size(500, 500);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

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
    /// VERIFY RECIPE NAME [TEA] IS INSIDE A [RECIPE BUTTON] WIDGET.
    ///
    ///

    testWidgets('Check if Tea is Inside a RecipeButton Widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: RecipeList()));

      final buttonFinder = find.ancestor(
          of: find.text('Tea'), matching: find.byType(RecipeButton));

      expect(buttonFinder, findsOneWidget);
    });
  });
}
