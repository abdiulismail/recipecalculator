import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipecalculator/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetail();
}
//todo add _recipedetailstate here

class _RecipeDetail extends State<RecipeDetail> {
  //todo add _sliderval here

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
            )
          ],
        ),
      ),
    );
  }
}
