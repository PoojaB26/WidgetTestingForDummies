import 'package:flutter/material.dart';
import 'package:test_food_with_flutter/recipes/constants.dart';

class TeaRecipeWithLongBoil extends StatefulWidget {
  @override
  _TeaRecipeWithLongBoilState createState() => _TeaRecipeWithLongBoilState();
}

class _TeaRecipeWithLongBoilState extends State<TeaRecipeWithLongBoil> {
  bool hasBoiled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Long Boil'),
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          key: Key('listView'),
          // crossAxisAlignment: CrossAxisAlignment.center,
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
              FutureBuilder<String>(
                  future: getOutput(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != 'NO RESPONSE')
                      return Text(
                        '${snapshot.data}',
                        key: Key('output'),
                        style: TextStyle(fontSize: 25),
                      );

                    return CircularProgressIndicator(
                      key: Key('progress'),
                    );
                  }),
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

  Future<String> getOutput() async {
    int water = int.parse(waterController.text);
    int sugar = int.parse(sugarController.text);
    int milk = int.parse(milkController.text);
    int teaPowder = int.parse(teaPowderController.text);
    await Future.delayed(Duration(seconds: 5));

    /// NO MILK / BLACK TEA!
    if (milk == 0) {
      if (water == WATER_ACTUAL && teaPowder == TEA_POWDER_ACTUAL) {
        return ANS_BLACK_TEA;
      }
    }

    /// Check if Milk is too much and tea is too White!
    if (milk > MILK_ACTUAL) {
      if (water == WATER_ACTUAL && teaPowder == TEA_POWDER_ACTUAL) {
        return ANS_LIGHT_TEA;
      }
    }

    return 'NO RESPONSE';
  }

  testOrTasteTea() async {
    setState(() {
      hasBoiled = true;
    });
  }
}
