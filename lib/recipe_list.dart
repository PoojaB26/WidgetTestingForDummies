import 'package:flutter/material.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RecipeButton('tea', 'Tea'),
              RecipeButton('tea2', 'Tea with Long Boil'),
              RecipeButton('tea3', 'Recipe with Long List Of Ingredients'),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeButton extends StatelessWidget {
  final String recipeName;
  final String keyName;

  RecipeButton(this.keyName, this.recipeName) : super(key: Key(keyName));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('$keyName');
      },
      child: Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24).copyWith(right: 100, left: 100),
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(8)),
        child: Text(
          '$recipeName',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
