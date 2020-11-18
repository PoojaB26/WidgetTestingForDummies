import 'package:flutter/material.dart';

import 'constants.dart';

class TeaRecipe extends StatefulWidget {
  @override
  _TeaRecipeState createState() => _TeaRecipeState();
}

class _TeaRecipeState extends State<TeaRecipe> {
  bool hasBoiled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Making Tea for 2 people',
              style: TextStyle(fontSize: 30),
            ),
            _buildIngredientRow('water', ' CUP WATER', waterController),
            _buildIngredientRow('milk', ' CUP MILK', milkController),
            _buildIngredientRow(
                'teaPowder', ' TSP TEA POWDER', teaPowderController),
            _buildIngredientRow('sugar', ' TSP SUGAR', sugarController),
            ElevatedButton(
              child: Text('BOIL'),
              onPressed: () {
                testOrTasteTea();
              },
            ),
            if (hasBoiled)
              Text(
                '$messageText',
                key: Key('output'),
                style: TextStyle(fontSize: 25),
              ),
          ],
        ),
      ),
    );
  }

  _buildIngredientRow(
      String keyStr, String ingredientVal, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: TextField(
              key: Key(keyStr),
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: ''),
            ),
          ),
          Text(ingredientVal)
        ],
      ),
    );
  }

  void testOrTasteTea() {
    setState(() {
      hasBoiled = true;
    });
    int water = int.parse(waterController.text);
    int sugar = int.parse(sugarController.text);
    num milk = num.parse(milkController.text);
    int teaPowder = int.parse(teaPowderController.text);

    if (milk == MILK_ACTUAL &&
        water == WATER_ACTUAL &&
        teaPowder == TEA_POWDER_ACTUAL &&
        sugar == SUGAR_ACTUAL) {
      setState(() {
        messageText = ANS_PERFECT_MILK_TEA;
      });
    }

    /// NO MILK / BLACK TEA!
    if (milk == 0) {
      if (water == WATER_ACTUAL && teaPowder == TEA_POWDER_ACTUAL) {
        setState(() {
          messageText = ANS_BLACK_TEA;
        });
      }
    }

    /// Check if Milk is too much and tea is too White!
    if (milk > MILK_ACTUAL) {
      if (water == WATER_ACTUAL && teaPowder == TEA_POWDER_ACTUAL) {
        setState(() {
          messageText = ANS_LIGHT_TEA;
        });
      }
    }

    // /// SUGAR HIGH
    // if (sugar > 2) {
    //   if (water == WATER_ACTUAL &&
    //       teaPowder == TEA_POWDER_ACTUAL &&
    //       milk == MILK_ACTUAL) {
    //     setState(() {
    //       messageText = ANS_SUGAR_HIGH;
    //     });
    //   }
    // }
    //
    // /// SUGAR LOW
    // if (sugar < 1) {
    //   if (water == WATER_ACTUAL &&
    //       teaPowder == TEA_POWDER_ACTUAL &&
    //       milk == MILK_ACTUAL) {
    //     setState(() {
    //       messageText = ANS_SUGAR_LOW;
    //     });
    //   }
    // }
  }
}
