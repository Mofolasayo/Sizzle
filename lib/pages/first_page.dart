//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/pages/login.dart';
//import 'package:google_fonts/google_fonts.dart';

//NOT IN USE
class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  late final double deviceHeight;
  late final double deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [backGroundImage(), gradient(), topLayer(context)],
    ));
  }

  Widget backGroundImage() {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(
            //https://img.freepik.com/premium-photo/burning-bowl-with-shrimp-vegetables-generated-by-ai_793210-2131.jpg?w=360
            //https://img.freepik.com/free-photo/delicious-burger-with-fresh-ingredients_23-2150857908.jpg?t=st=1710248501~exp=1710252101~hmac=5df43815dc196f1bf6fbf83c11cbacbcc1e0ec5e4a48e2a7420330df74e60d92&w=360
            //https://img.freepik.com/free-photo/close-up-delicious-chicken-meal_23-2150741763.jpg?t=st=1710248559~exp=1710252159~hmac=54c358f12a8ac96e4bfe66aecfc01aaa90d1b8ce083ac0c4f9e38a0e3e97f922&w=360
            //https://img.freepik.com/free-photo/close-up-delicious-asian-food_23-2150535876.jpg?t=st=1710248597~exp=1710252197~hmac=7eb98dee891f4fba2b475192f24f0dcb70ce79009535b7db750ba7f7be4de0f2&w=360
            //https://img.freepik.com/free-photo/view-delicious-burger_23-2150777797.jpg?t=st=1710248622~exp=1710252222~hmac=5959e23981fd44d33069b4425b8dedc336724f8326a3fb02fdedfcbef1bbc141&w=826
            //https://img.freepik.com/free-photo/grilled-meat-skewers-with-fresh-vegetables-spices-generated-by-ai_188544-53896.jpg?t=st=1710248655~exp=1710252255~hmac=ccc164d43c153af9ef97fb64c292f7a9eec897308588b343c062aed5e7fb0554&w=740
            //https://img.freepik.com/premium-photo/meat_100342-45.jpg?w=360
            //https://img.freepik.com/free-photo/close-up-delicious-asian-food_23-2150535875.jpg?t=st=1710248751~exp=1710252351~hmac=79876f4ff61ab7e53ef8da56b9d06d0889e4fa2b3a1542f1016687bc508b8c05&w=360
            //https://img.freepik.com/free-photo/delicious-taco-studio_23-2151047931.jpg?t=st=1710248848~exp=1710252448~hmac=b77dd2052645f5d897667a048db463eb0ce4e1d4c3e253a31189e4cf403d5fa4&w=740
            //https://img.freepik.com/free-photo/delicious-pasta-plate_23-2150690617.jpg?t=st=1710248893~exp=1710252493~hmac=4b59d55681ef409821fa9ea7c271b4b218c3d59135c58836ac8baecfe3350400&w=360
            //https://img.freepik.com/free-photo/delicious-food-table_23-2150857724.jpg?t=st=1710248922~exp=1710252522~hmac=5cbb7e3fe9c9061ecffd4af58ef256f70ce7b3fa3ded59ef6a6b67ed1f823bbb&w=826
            'https://img.freepik.com/free-photo/delicious-chicken-table_144627-8759.jpg?t=st=1710059863~exp=1710063463~hmac=048b7127febf0934772b2270e0fe7fc35ec06b38249af908b8f92be02314dc6c&w=360'),
      )),
    );
  }

  Widget topLayer(BuildContext context) {
    return SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Text('Sizzle',
                    style: GoogleFonts.aboreto(
                      textStyle: const TextStyle(
                          fontSize: 55, color: Color.fromRGBO(214, 154, 3, 1)),
                    ) // Color.fromRGBO(156, 112, 1, 1))
                    ),
                Text(
                  "Cook with confidence",
                  style: TextStyle(
                      color: Color.fromRGBO(156, 112, 1, 1),
                      fontStyle: FontStyle.italic,
                      fontSize: 13),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(156, 112, 1, 1),
                ),
                child: const Text('Start Cooking',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )))
          ],
        ));
  }

  Widget gradient() {
    return IgnorePointer(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(24, 23, 23, 0.6),
                Colors.transparent,
              ],
              //stops: [0.56, 0.1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }
}
