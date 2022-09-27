import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipecalculator/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetail();
}

int _sliderVal = 1;

class _RecipeDetail extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(widget.recipe.imageUrl),
                )),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final myIngredients = widget.recipe.ingredients[index];
                return Text(
                  '${myIngredients.quantity * _sliderVal}${myIngredients.measure} ${myIngredients.name}',
                  // style: const TextStyle(
                  //     backgroundColor: Colors.black12, fontSize: 30),
                );
              },
            )),
            //todo add slider here
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '${_sliderVal * widget.recipe.servings} servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
