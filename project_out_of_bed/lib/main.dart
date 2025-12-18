import 'package:flutter/material.dart';
import 'package:project_out_of_bed/pages/home_page.dart';
import 'package:project_out_of_bed/pages/connexion.dart'; 
import 'package:project_out_of_bed/pages/inscription.dart'; 



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Out Of Bed',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}