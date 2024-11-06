import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/pages/login.dart';
import 'package:recipe_app/pages/recipe_page.dart';
import 'package:recipe_app/services/data_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mealFilter = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Sizzle",
              style: GoogleFonts.aboreto(
                textStyle: const TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(214, 154, 3, 1),
                    fontWeight: FontWeight.bold),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            SizedBox(height: deviceHeight * 0.007),
            recipeButtons(),
            SizedBox(height: deviceHeight * 0.02),
            recipeList()
          ]),
        ));
  }

  Widget recipeButtons() {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.06,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: FilledButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(214, 154, 3, 0.8))),
                  onPressed: () {
                    setState(() {
                      _mealFilter = "breakfast";
                    });
                  },
                  child: const Text(
                    "🍳 Breakfast",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: FilledButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(214, 154, 3, 0.8))),
                onPressed: () {
                  setState(() {
                    _mealFilter = "lunch";
                  });
                },
                child: const Text(
                  "🍗 Lunch",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: FilledButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(214, 154, 3, 0.8))),
                  onPressed: () {
                    setState(() {
                      _mealFilter = "dinner";
                    });
                  },
                  child: const Text(
                    "🍝 Dinner",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: FilledButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(214, 154, 3, 0.8))),
                onPressed: () {
                  setState(() {
                    _mealFilter = "snack";
                  });
                },
                child: const Text(
                  "🍪 Snacks",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: FilledButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 10)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(214, 154, 3, 0.8))),
                  onPressed: () {
                    setState(() {
                      _mealFilter = "beverage";
                    });
                  },
                  child: const Text(
                    "🍹 Drinks",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ));
  }

  Widget recipeList() {
    return Expanded(
        child: FutureBuilder(
            future: DataService().getRecipes(_mealFilter),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Recipe recipe = snapshot.data![index];

                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.4,
                              color: Color.fromRGBO(43, 43, 43, 1))),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RecipePage(
                            recipe: recipe,
                          );
                        }));
                      },
                      contentPadding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      isThreeLine: true,
                      title: Text(
                        recipe.name,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 225, 227, 228),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "${recipe.cuisine}\ndifficulty: ${recipe.difficulty}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 225, 227, 228),
                          fontSize: 13,
                        ),
                      ),
                      leading: SizedBox(
                        height: deviceHeight * 0.08,
                        child: Image.network(
                          recipe.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              recipe.rating.toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 202, 198, 198),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.star,
                              color: Color.fromRGBO(214, 154, 3, 0.8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            })));
  }
}
/*if (snapshot.hasError) {trailing: Row(children: [
                        Text(recipe.rating.toString()),
                        const Icon(Icons.star),
                        
                      ],)
                return const Center(
                  child: Text(
                    "Unable to load data...",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(161, 116, 3, 1),
                        fontWeight: FontWeight.bold),
                  ),
                );
              }*/