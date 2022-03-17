// import 'package:eventify/homepage.dart';
// import 'package:eventify/signup_page.dart';
// import 'package:eventify/signup_page.dart';
// import 'package:eventify/signup_page.dart';
// import 'package:eventify/signup_success.dart';
// import 'package:eventify/signup_verification.dart';
// import 'package:eventify/signup_verification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
