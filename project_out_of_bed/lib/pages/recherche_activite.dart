import 'package:flutter/material.dart';
import 'package:project_out_of_bed/ComponentReuse/app_bar_logo.dart';

class RechercheActivite extends StatefulWidget {
  const RechercheActivite({super.key});

  @override
  State<RechercheActivite> createState() => _RechercheActiviteState();
}

class _RechercheActiviteState extends State<RechercheActivite> {
  int tabsCount = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: AppBarLogo(),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.cloud_outlined),
                  text: "Voir sur la liste",
                ),
                Tab(
                  icon: const Image(image: AssetImage("/assets/icons/GoogleMap.png"), width: 50,height: 50,),
                  text: "Voir sur la carte",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
