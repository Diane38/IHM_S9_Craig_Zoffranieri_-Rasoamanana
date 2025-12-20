import 'package:flutter/material.dart';
import 'package:project_out_of_bed/models/activite.dart';
import 'package:project_out_of_bed/pages/tab_activity.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Données simulées
  List<Activite> _getPublishedActivities() {
    return [
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Sala_de_cine.jpg/500px-Sala_de_cine.jpg',
        title: 'Cinéma lalala',
        description: 'Cras semper, mi elementum pellentesque pellentesque...',
        info: [
          {'Durée': '2h'},
          {'Lieu': 'Grenoble'},
          {'Niveau de foule': '3/5'},
        ],
        latitude: 45.1885,
        longitude: 5.7245,
        likes: 42,
        comments: 12,
        saves: 20,
      ),
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Alta_via_meranese_2005-05.JPG/1200px-Alta_via_meranese_2005-05.JPG',
        title: 'Randonnée en forêt',
        description: 'Une randonnée bucolique pour se détendre dans la nature.',
        info: [
          {'Durée': '3h'},
          {'Lieu': 'Seyssinet-Pariset'},
          {'Niveau de foule': '1/5'},
        ],
        latitude: 45.1667,
        longitude: 5.7167,
        likes: 15,
        comments: 3,
        saves: 7,
      ),
    ];
  }

  List<Activite> _getMentionActivities() {
    return [
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Sala_de_cine.jpg/500px-Sala_de_cine.jpg',
        title: 'Cinéma lalala',
        description: 'Cras semper, mi elementum pellentesque pellentesque...',
        info: [
          {'Durée': '2h'},
          {'Lieu': 'Grenoble'},
          {'Niveau de foule': '3/5'},
        ],
        latitude: 45.1885,
        longitude: 5.7245,
        likes: 42,
        comments: 12,
        saves: 20,
      ),
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Alta_via_meranese_2005-05.JPG/1200px-Alta_via_meranese_2005-05.JPG',
        title: 'Randonnée en forêt',
        description: 'Une randonnée bucolique pour se détendre dans la nature.',
        info: [
          {'Durée': '3h'},
          {'Lieu': 'Seyssinet-Pariset'},
          {'Niveau de foule': '1/5'},
        ],
        latitude: 45.1667,
        longitude: 5.7167,
        likes: 15,
        comments: 3,
        saves: 7,
      ),
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Alta_via_meranese_2005-05.JPG/1200px-Alta_via_meranese_2005-05.JPG',
        title: 'Pique-nique au parc',
        description: 'Un moment convivial en famille...',
        info: [
          {'Durée': '2h'},
          {'Lieu': 'Parc Paul Mistral'},
          {'Niveau de foule': '2/5'},
        ],
        latitude: 45.1750,
        longitude: 5.7300,
        likes: 28,
        comments: 8,
        saves: 15,
      ),
    ];
  }

  List<Activite> _getFavoriteActivities() {
    return [
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Sala_de_cine.jpg/500px-Sala_de_cine.jpg',
        title: 'Cinéma lalala',
        description: 'Cras semper, mi elementum pellentesque pellentesque...',
        info: [
          {'Durée': '2h'},
          {'Lieu': 'Grenoble'},
          {'Niveau de foule': '3/5'},
        ],
        latitude: 45.1885,
        longitude: 5.7245,
        likes: 42,
        comments: 12,
        saves: 20,
      ),
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Alta_via_meranese_2005-05.JPG/1200px-Alta_via_meranese_2005-05.JPG',
        title: 'Randonnée en forêt',
        description: 'Une randonnée bucolique pour se détendre dans la nature.',
        info: [
          {'Durée': '3h'},
          {'Lieu': 'Seyssinet-Pariset'},
          {'Niveau de foule': '1/5'},
        ],
        latitude: 45.1667,
        longitude: 5.7167,
        likes: 15,
        comments: 3,
        saves: 7,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Vous êtes connecté(e) !',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Header du profil
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'OUT OF BED',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                // TabBar pour les onglets
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Publications'),
                    Tab(text: 'Likes'),
                    Tab(text: 'Enregistrés'),
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              ],
            ),
          ),

          // TabBarView pour afficher les activités
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Publications
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: _getPublishedActivities()
                        .map((activite) => ActivityLabel(activite: activite))
                        .toList(),
                  ),
                ),
                // Jaime
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: _getMentionActivities()
                        .map((activite) => ActivityLabel(activite: activite))
                        .toList(),
                  ),
                ),
                // Favoris
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: _getFavoriteActivities()
                        .map((activite) => ActivityLabel(activite: activite))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}