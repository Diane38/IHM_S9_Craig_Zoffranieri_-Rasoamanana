import 'package:flutter/material.dart';

// vignette d'activité
class ActivityLabel extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String duration;
  final String location;
  final String crowd;
  final int likes;
  final int comments;
  final int saves;

  const ActivityLabel({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.location,
    required this.crowd,
    required this.likes,
    required this.comments,
    required this.saves,
  });

   Widget _buildInteractionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.yellow.shade200, 
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInteractionItem(Icons.thumb_up, likes.toString()),
          _buildInteractionItem(Icons.comment, comments.toString()),
          _buildInteractionItem(Icons.bookmark, saves.toString()),
        ],
      ),
    );
  }

  Widget _buildInteractionItem(IconData icon, String count) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.black54),
        const SizedBox(height: 4),
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
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
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                title,
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
              description,
              style: TextStyle(color: Colors.grey.shade800),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildDetailActivity('Durée', duration),
                _buildDetailActivity('Lieu', location),
                _buildDetailActivity('Niveau de foule', crowd),
              ],
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

  List<ActivityLabel> _buildActivities() {
    return [
      ActivityLabel(
        title: 'RANDONNEE EN FORET',
        description: 'Une randonnée bucolique pour se détendre dans la nature.',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Alta_via_meranese_2005-05.JPG/1200px-Alta_via_meranese_2005-05.JPG', 
        duration: '3h',
        location: 'Seyssinet-Pariset',
        crowd: '1/5',
        likes: 15,
        comments: 3,
        saves: 7,
      ),
      ActivityLabel(
        title: 'Sortie au cinéma',
        description: 'Découvrez les nouveaux films sortis !',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Sala_de_cine.jpg/500px-Sala_de_cine.jpg',
        duration: '',
        location: 'Grenoble Centre',
        crowd: '2/5',
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
          
          ..._buildActivities(),
          
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
          
          ..._buildActivities(),
        ],
      ),
    );
  }
}
