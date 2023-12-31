import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Futskor',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),  //uygulamanın ana yazı fontunu ayarladım  
        primarySwatch: Colors.blueGrey,        //uygulamanın default rengını ayarladım
      ),
      home: const HomePage(),
    );
  }
}