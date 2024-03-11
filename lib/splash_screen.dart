import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/pages/login.dart';
import 'package:recipe_app/util/gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var deviceHeight;
  var deviceWidth;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: deviceHeight,
          width: deviceWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/delicious-chicken-table_144627-8759.jpg?t=st=1710059863~exp=1710063463~hmac=048b7127febf0934772b2270e0fe7fc35ec06b38249af908b8f92be02314dc6c&w=360'),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: deviceHeight * 0.19,
            ),
            Text('Sizzle',
                style: GoogleFonts.aboreto(
                  textStyle: const TextStyle(
                      fontSize: 55,
                      color: Color.fromRGBO(214, 154, 3, 1),
                      fontWeight: FontWeight.w500),
                ) // Color.fromRGBO(156, 112, 1, 1))
                ),
            const Text(
              "Cook with confidence",
              style: TextStyle(
                  color: Color.fromRGBO(156, 112, 1, 1),
                  fontStyle: FontStyle.italic,
                  fontSize: 13),
            )
          ]),
        ),
        const myGradient(),
      ]),
    );
  }
}
