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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: Icons.home_outlined,
            label: "ACCUEIL",
            color: Colors.black,
            destination: const HomePage(),
          ),
          _buildNavItem(
            context,
            icon: Icons.lightbulb_outline,
            label: "ACTIVITES",
            color: Colors.black,
            destination: const RechercheActivite(),
          ),
          _buildNavItem(
            context,
            icon: Icons.add_circle_outline,
            label: "PUBLIER",
            color: Colors.black,
            destination: const Publication(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required Widget destination}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}