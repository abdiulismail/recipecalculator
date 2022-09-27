import 'package:flutter/material.dart';
import 'package:recipecalculator/models/recipe.dart';
import 'package:recipecalculator/recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final myTheme = ThemeData();
    return MaterialApp(
      theme: myTheme.copyWith(
          colorScheme: myTheme.colorScheme.copyWith(
        primary: Colors.red,
        secondary: Colors.black,
      )),
      home: const MyHomePage(title: 'Recipe calculator app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //1
    return Scaffold(
      //2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //3
      body: SafeArea(
        child: ListView.builder(
          itemCount: Recipe
              .samples.length, //determines the number of rows the list has
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RecipeDetail(recipe: Recipe.samples[index]);
                }));
              },
              child: buildRecipeCard(Recipe.samples[index]),
            );
          },
        ),
      ),
    );
  }

// add buildrecipecard() here
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image(image: AssetImage(recipe.imageUrl)),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                recipe.label,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Palatino'),
              )
            ],
          ),
        ));
  }
}
