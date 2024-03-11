import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/pages/first_page.dart';
import 'package:recipe_app/splash_screen.dart';
import 'package:recipe_app/util/gradient.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var deviceHeight;
var deviceWidth;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: deviceHeight * 0.45,
                width: deviceWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/hot-grilled-spare-ribs-with-barbecue-sauce-with-fire-ai-generative_123827-23823.jpg?t=st=1710171412~exp=1710175012~hmac=0f0054ce8e7163a065736c4ed38209850372f53fe29d01ae0fab81ba123da6d4&w=740")),
                  /*borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10.0))*/
                ),
              ),
              loginForm()
            ],
          ),
        ));
  }

  Widget loginForm() {
    return SizedBox(
      height: deviceHeight * 0.5,
      width: deviceWidth,
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start Cooking With Confidence...",
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(214, 154, 3, 1),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(9.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.grey)),
            style: const TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(9.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey)),
            style: const TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.white),
            ),
          ),
          //SizedBox(height: deviceHeight * 0.05),
          ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FirstPage())),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(156, 112, 1, 1),
              ),
              child: const Text('Log In',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ))),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Sign up",
                style: TextStyle(color: Color.fromRGBO(156, 112, 1, 1)),
              ),
            ],
          )
        ],
      )),
    );
  }
}