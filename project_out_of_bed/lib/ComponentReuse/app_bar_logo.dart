import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_out_of_bed/pages/connexion.dart';
import 'package:project_out_of_bed/pages/inscription.dart';

class AppBarLogo extends StatelessWidget implements PreferredSizeWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
        elevation: 0,
        titleSpacing: 16,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Texte
                  Text(
                    "OUT OF BED",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),

                  SizedBox(width: 12),

                  // SVG (lit + personnage)
                  SvgPicture.asset('assets/icons/logo.svg', height: 35),

                  Spacer(),

                  // Boutons connexion et inscription
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                        }, 
                        child: const Text(
                          "Se connecter",
                          style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container( 
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push( context,
                              MaterialPageRoute(builder: (context) => const InscriptionPage()),
                              );
                              },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Text("S'inscrire", 
                              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                ],
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}