import 'package:flutter/material.dart';
import 'package:project_out_of_bed/ComponentReuse/app_bar_logo.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/activite.dart';

class DetailPage extends StatefulWidget {
  final Activite activite; // On passe l'activité à afficher

  const DetailPage({super.key, required this.activite});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _openGoogleMap() async {
    if (widget.activite.latitude == null || widget.activite.longitude == null) return;

    final latitude = widget.activite.latitude!;
    final longitude = widget.activite.longitude!;
    final googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (!await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication)) {
      throw 'Impossible d’ouvrir Google Maps';
    }
  }

  @override
  Widget build(BuildContext context) {
    final activite = widget.activite;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBarLogo(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // Container pour l'image
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(activite.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Container pour le titre
                Text(
                  activite.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),

                // pour la description
                Text(
                  activite.description,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),

                // pour les info
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: activite.info.map((item) {
                      final key = item.keys.first;
                      final value = item[key]!;
                      return Column(
                        children: [
                          _keyValueRow(key, value),
                          Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),

                // pour like et save
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up),
                      label: Text('Like'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark),
                      label: Text('Save'),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // pour Bouton go
                ElevatedButton(
                  onPressed: _openGoogleMap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Y ALLER"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _keyValueRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
