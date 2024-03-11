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
