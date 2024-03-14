import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
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
    );
  }
}
