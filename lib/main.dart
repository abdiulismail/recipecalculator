import 'package:flutter/material.dart';
import 'package:recipecalculator/recipe.dart';

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
            //todo : update to return recipe card
            return Text(Recipe.samples[index].label);
          },
        ),
      ),
    );
  }
  //todo : add buildrecipecard() here
}
