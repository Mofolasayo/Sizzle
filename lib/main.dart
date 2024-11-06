import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/pages/login.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/splash_screen.dart';
import 'package:recipe_app/util/smoke_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sizzle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(214, 154, 3, 1)),
          //brightness: Brightness.dark,
          textTheme: const TextTheme(
            bodyMedium:
                TextStyle(color: Colors.white), // Set text color globally
          ),

          useMaterial3: true,

          //textTheme: GoogleFonts.lemonTextTheme(),
        ),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => const SplashScreen(),
          "/login": (context) => const Login(),
          "/home": (context) => const HomePage(),
        });
  }
}

/*Bright Yellow: RGB(255, 255, 0)
Lemon Yellow: RGB(255, 250, 205)
Golden Yellow: RGB(255, 223, 0)
Mustard Yellow: RGB(255, 219, 88)
Mango Yellow: RGB(244, 187, 68)*/