import '../models/activite.dart';

class ActivitesData {
  static final List<Activite> activites = [
    Activite(
      imagePath: 'assets/nature.jpg',
      title: 'Randonnée en forêt',
      description: 'Une randonnée bucolique pour se détendre dans la nature.',
      info: [
        {'Durée': '3h'},
        {'Lieu': 'Seyssinet Parisset'},
        {'Niveau de foule': '1/5'},
      ],
      latitude: 45.1885,
      longitude: 5.7250,
    ),
    Activite(
      imagePath: 'assets/nature.jpg',
      title: 'Escalade en montagne',
      description: 'Une activité pour les amateurs de sensations fortes.',
      info: [
        {'Durée': '5h'},
        {'Lieu': 'Alpes'},
        {'Niveau de foule': '2/5'},
      ],
      latitude: 45.9234,
      longitude: 6.1234,
    ),
    Activite(
      imagePath: 'assets/nature.jpg',
      title: 'Kayak sur le lac',
      description: 'Profitez de l’eau et de la tranquillité du lac.',
      info: [
        {'Durée': '2h'},
        {'Lieu': 'Lac de Paladru'},
        {'Niveau de foule': '3/5'},
      ],
      latitude: 45.3333,
      longitude: 5.5678,
    ),
  ];
}