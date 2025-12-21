import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_out_of_bed/ComponentReuse/app_bar_logo.dart';
import 'package:project_out_of_bed/ComponentReuse/bottom_app_bar_page.dart';
import 'package:project_out_of_bed/data/activites_data.dart';
import 'package:project_out_of_bed/models/activite.dart';
import 'package:project_out_of_bed/pages/home_page.dart';
import 'package:provider/provider.dart';

class Publication extends StatefulWidget {
  const Publication({super.key});

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  late var liste = context.watch<ActivitesData>().activites;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dureeController = TextEditingController();
  final TextEditingController _lieuController = TextEditingController();
  final TextEditingController _fouleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLogo(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // champs pour nom
                TextFormField(
                  controller: _nomController,
                  decoration: const InputDecoration(
                    labelText: "Nom de l'activité",
                    hintText: "Veuiller nommer l'activité",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                ),

                // champs pour la description
                const SizedBox(height: 32),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Description de l'activité",
                    hintText: "Veuiller créer une description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une description';
                    }
                    return null;
                  },
                ),

                // champs pour durée
                const SizedBox(height: 32),
                TextFormField(
                  controller: _dureeController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Durée',
                    hintText: "Donnée une durée moyenne en h",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer une durée';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _lieuController,
                  decoration: const InputDecoration(
                    labelText: "Lieu",
                    hintText: "Donnée le lieu de l'activité",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un lieu';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _fouleController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1), // un seul chiffre
                  ],
                  decoration: const InputDecoration(
                    labelText: "Foule",
                    hintText: "Veuillez entrer un nombre entre 1 et 5",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if ((value == null || value.isEmpty) &&
                        (int.parse(value.toString()) > 5 ||
                            int.parse(value.toString()) < 1)) {
                      return 'Veuillez entrer un nombre entre 1 et 5';
                    }
                    return null;
                  },
                ),

                // champs pour bouton
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      context.read<ActivitesData>().ajouter(
                        Activite(
                          imagePath: "assets/nature.jpg", 
                          title: _nomController.text, 
                          description: _descriptionController.text, 
                          info: [
                            {'Durée': _dureeController.text},
                            {'Lieu': _lieuController.text},
                            {'Niveau de foule': "${_fouleController.text}/5"},
                          ]
                          )
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text("Publier"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBarPage(),
    );
  }
}