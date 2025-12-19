import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class RechercheActivite extends StatefulWidget {
  const RechercheActivite({super.key});

  @override
  State<RechercheActivite> createState() => _RechercheActiviteState();
}

class _RechercheActiviteState extends State<RechercheActivite> {
  int tabsCount = 2;
  List<String> titles = <String>['Voir avec en liste', 'Voir sur GoogleMap'];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState(){
    _searchController.addListener(_searchChanged);
  }

  _searchChanged() {
    searchResult();
  }

  searchResult(){

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: _appBarResearch(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
            

            ),
            Expanded(
              child: Container(
                height:MediaQuery.of(context).size.height,
                child: TabBarView(
                    children: <Widget>[
                      Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: 25,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(title: Text('${titles[0]} $index'));
                          },
                        ),
                      ),
                      ListView.builder(
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(title: Text('${titles[1]} $index'));
                        },
                      ),
                    ],
                  ),
              ),
            ),
              ],
            ),
           //bottomNavigationBar: AppBar(), 
        ),
      );
  }

  PreferredSize _appBarResearch(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(200),
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
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),

                  SizedBox(width: 12),

                  // SVG (lit + personnage)
                  SvgPicture.asset('assets/icons/logo.svg', height: 40),

                  Spacer(),

                  // Bouton carré en haut à droite
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RechercheActivite(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              height: 70,
              icon: const Icon(Icons.list),
              text: "Voir sur la liste",
            ),
            Tab(
              height: 70,
              icon: Image.asset(
                'assets/icons/GoogleMap.png',
                width: 25,
                height: 25,
              ),
              text: "Voir sur la carte",
            ),
          ],
        ),
      ),
    );
  }
}
