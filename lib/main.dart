import 'package:flutter/material.dart';
import 'package:test_food_with_flutter/recipe_list.dart';
import 'package:test_food_with_flutter/recipes/tea.dart';
import 'package:test_food_with_flutter/recipes/tea_2.dart';
import 'package:test_food_with_flutter/recipes/tea_3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        'tea': (context) => TeaRecipe(),
        'tea2': (context) => TeaRecipeWithLongBoil(),
        'tea3': (context) => RecipeWithLongList(),
      },
      home: Scaffold(appBar: AppBar(), body: RecipeList()),
    );
  }
}
