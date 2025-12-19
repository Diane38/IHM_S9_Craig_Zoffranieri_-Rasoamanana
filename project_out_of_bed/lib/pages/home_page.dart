import 'package:flutter/material.dart';
import 'package:project_out_of_bed/ComponentReuse/app_bar_logo.dart';
import 'package:project_out_of_bed/ComponentReuse/tab_activity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3 , 
        child: Scaffold(
          appBar: const AppBarLogo(), 
          body: const TabBarView(
            children: [
              TabContentPage(title: 'Actualités'),
              TabContentPage(title: 'Populaires'),
              TabContentPage(title: 'Nouveautés'),
            ],
          ),
        ),
      ),
    );
  }
}