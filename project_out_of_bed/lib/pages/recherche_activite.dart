import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_out_of_bed/ComponentReuse/bottom_app_bar_page.dart';
import 'package:project_out_of_bed/data/activites_data.dart';
import 'package:provider/provider.dart';

List<String> titles = <String>['Voir avec en liste', 'Voir sur GoogleMap'];

class RechercheActivite extends StatefulWidget {
  const RechercheActivite({super.key});

  @override
  State<RechercheActivite> createState() => _RechercheActiviteState();
}

class _RechercheActiviteState extends State<RechercheActivite> {
  late var liste = context.watch<ActivitesData>().activites;
  int tabsCount = 2;
  var listeRes=[];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchChanged);
  }

  _searchChanged() {
    //searchResult();
  }

  /*searchResult() {
    var liste_res=[];
    if(_searchController.text!=""){
      for(var acti in liste){
        var title=acti.title.toLowerCase();
        var desc=acti.description.toLowerCase();

        if(title.contains(_searchController.text.toLowerCase())||
        desc.contains(_searchController.text.toLowerCase())){
          liste_res.add(acti);
        }
      }
    }else{
      liste_res=context.watch<ActivitesData>().activites;
    }
    setState(() {
      listeRes=liste_res;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: _appBarResearch(context),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Que cherches-tu?',
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: <Widget>[
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: liste.length,
                          itemBuilder: (_, i) => Card(
                            margin: const EdgeInsets.only(bottom: 20),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    liste[i].imagePath,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Text(
                                      liste[i].title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.5,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.all(12.0),
                                  color: Colors.grey.shade300,
                                  child: Text(
                                    liste[i].description,
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
        ),
        bottomNavigationBar: BottomAppBarPage(),
      ),
    );
  }

  AppBar _appBarResearch(BuildContext context) {
    return AppBar(
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
    );
  }
}
