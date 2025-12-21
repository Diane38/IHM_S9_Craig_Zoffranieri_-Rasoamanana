import 'package:flutter/material.dart';
import 'package:project_out_of_bed/ComponentReuse/app_bar_logo.dart';
import 'package:project_out_of_bed/ComponentReuse/bottom_app_bar_page.dart';
import 'package:project_out_of_bed/pages/tab_activity.dart';
import 'package:project_out_of_bed/pages/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarLogo(),
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Actualités'),
                Tab(text: 'Populaires'),
                Tab(text: 'Nouveautés'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TabContentPage(title: 'Actualités'),
                  TabContentPage(title: 'Populaires'),
                  TabContentPage(title: 'Nouveautés'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: const Icon(Icons.person),
        ),
        
        
        //AppBar du bas permettant de se déplacer entre les pages
        bottomNavigationBar: BottomAppBarPage(),
      ),
    );
  }
}
