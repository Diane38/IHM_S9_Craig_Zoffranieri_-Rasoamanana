import 'package:flutter/material.dart';
import 'package:project_out_of_bed/ComponentReuse/app_bar_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final tabs = ["Actualités", "Populaires", "Nouveautés"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBarLogo(),
      ),
      body: Center(
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = index == selectedIndex;

            return Padding(
              padding: const EdgeInsets.only(right: 24),
              child: TextButton(
                onPressed: () {
                  setState(() => selectedIndex = index);
                },
                style: TextButton.styleFrom(
                  foregroundColor: isSelected ? Colors.blue : Colors.grey,
                  textStyle: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                child: Column(
                  children: [
                    Text(tabs[index]),
                    SizedBox(height: 4),

                    // Soulignement bleu
                    if (isSelected)
                      Container(height: 2, width: 24, color: Colors.blue),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  /*Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              overlayColor: Colors.white,
              textStyle: TextStyle(
                inherit: true,
                fontWeight: FontWeight.bold, 
                fontSize: 25,)
            ),
            onPressed: () {},
            child: Text("Out Of Bed"),
          ),
          IconButton(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              overlayColor: Colors.white
            ),
            hoverColor: Colors.white,
            onPressed: () {
              print("Bouton appuyé !");
            },
            icon: SvgPicture.asset(
              'assets/icons/logo.svg',
              height: 60,
              width: 60,
            ),
            color: Colors.black,
          ),
        ],
      ),*/
}
