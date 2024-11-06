import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;
  const RecipePage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(recipe.image), fit: BoxFit.cover)),
            ),
            _recipeDetails(),
            _recipeIngredients(),
            _recipeInstructions()
          ],
        ),
      ),
    );
  }

  Widget _recipeDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(recipe.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(214, 154, 3, 1),
              )),
          Text(
            "${recipe.cuisine}, ${recipe.difficulty}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          Text(
            "Prep Time: ${recipe.prepTimeMinutes} Minutes | Cook Time ${recipe.cookTimeMinutes} Minutes",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                recipe.rating.toString(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.star,
                color: Color.fromRGBO(214, 154, 3, 0.8),
              ),
              Text(
                " ${recipe.reviewCount} reviews",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _recipeIngredients() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
      child: Column(
        children: recipe.ingredients.map((i) {
          return Row(
            children: [
              const Icon(
                Icons.check,
                color: Color.fromRGBO(214, 154, 3, 1),
              ),
              Text("  $i")
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _recipeInstructions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: recipe.instructions.map((i) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              i,
              maxLines: 3,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 15),
            ),
          );
        }).toList(),
      ),
    );
  }
}
