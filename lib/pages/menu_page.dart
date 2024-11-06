import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
    );
  }
}
