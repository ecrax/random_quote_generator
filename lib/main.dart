import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_quote_generator/screens/random_quote_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Color(0xFFF7DF94),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: RandomQuoteScreen(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
