import 'package:flutter/material.dart';
import 'package:project_out_of_bed/pages/home_page.dart';
import 'package:project_out_of_bed/pages/publication.dart';
import 'package:project_out_of_bed/pages/recherche_activite.dart';

class BottomAppBarPage extends StatelessWidget implements PreferredSizeWidget {
  const BottomAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              icon: const Icon(Icons.home),
              label: const Text("Accueil"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RechercheActivite()),
                );
              },
              icon: const Icon(Icons.light),
              label: const Text("Idée"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Publication()),
                );
              },
              icon: const Icon(Icons.light),
              label: const Text("Idée"),
            ),
          ],
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}