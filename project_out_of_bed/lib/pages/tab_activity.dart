import 'package:flutter/material.dart';
import 'package:project_out_of_bed/models/activite.dart';

// vignette d'activité

class ActivityLabel extends StatelessWidget {
  final Activite activite;

  const ActivityLabel({
    super.key,
    required this.activite,
  });

  Widget _buildInteractionItem(IconData icon, String count, VoidCallback onTap) {
    return InkWell(
      onTap: onTap, 
      borderRadius: BorderRadius.circular(8), 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24, color: Colors.black54),
            const SizedBox(height: 4),
            Text(
              count,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.yellow.shade200, 
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInteractionItem(Icons.thumb_up, activite.likes.toString(), () {
            print("Liked");
          }),
          _buildInteractionItem(Icons.comment, activite.comments.toString(), () {
            print("Commented");
          }),
          _buildInteractionItem(Icons.bookmark, activite.saves.toString(), () {
            print("Saved");
          }),
        ],
      ),
    );
  }

  // description details
  Widget _buildDetailActivity(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              activite.imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                activite.title,
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
              activite.description,
              style: TextStyle(color: Colors.grey.shade800),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: activite.info
                  .map((item) => _buildDetailActivity(
                        item.keys.first,
                        item.values.first,
                      ))
                  .toList(),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: _buildInteractionBar(),
          ),
        ],
      ),
    );
  }
}


class TabContentPage extends StatelessWidget {
  final String title;
  
  const TabContentPage({
    super.key,
    required this.title,
  });

  List<Activite> _buildActivities() {
    return [
      Activite(
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Alta_via_meranese_2005-05.JPG/1200px-Alta_via_meranese_2005-05.JPG',
        title: 'RANDONNEE EN FORET',
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
        imagePath: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Sala_de_cine.jpg/500px-Sala_de_cine.jpg',
        title: 'Sortie au cinéma',
        description: 'Découvrez les nouveaux films sortis !',
        info: [
          {'Durée': '2h'},
          {'Lieu': 'Grenoble Centre'},
          {'Niveau de foule': '2/5'},
        ],
        latitude: 45.1885,
        longitude: 5.7245,
        likes: 42,
        comments: 12,
        saves: 20,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Text(
              title == 'Nouveautés' ? 'Dernières activités' : 'Activités populaires',  
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          ..._buildActivities()
              .map((activite) => ActivityLabel(activite: activite))
              .toList(),
          
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
            child: Text(
              'Dernières activités ajoutées',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          ..._buildActivities()
              .map((activite) => ActivityLabel(activite: activite))
              .toList(),
        ],
      ),
    );
  }
}