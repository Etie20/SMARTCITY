import 'package:flutter/material.dart';

class MyReportsPage extends StatelessWidget {
  const MyReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir votre couleur rouge spécifique
    const Color couleurRougeSpecifique = Color(0xFFD32F2F);
    // Définir une couleur de contraste pour le texte sur fond rouge
    const Color couleurTexteSurFondRouge = Colors.white;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Un fond gris clair pour le corps de la page
      appBar: AppBar(
        // 1. Centrer le titre
        centerTitle: true,
        // 2. Définir la couleur de fond de l'AppBar
        backgroundColor: couleurRougeSpecifique,
        // 3. Définir le style du titre (y compris la couleur du texte)
        title: const Text(
          'Mes signalements',
          style: TextStyle(
            color: couleurTexteSurFondRouge,
            fontWeight: FontWeight.bold, // Optionnel: rendre le titre en gras
          ),
        ),
        // 4. Assurer que les icônes de l'AppBar (comme le bouton retour) sont aussi en blanc
        iconTheme: const IconThemeData(color: couleurTexteSurFondRouge),
        elevation: 0, // Optionnel: enlever l'ombre de l'AppBar si désiré
      ),
      body: const Center(
        child: Text(
          'Historique des signalements',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54, // Couleur pour le texte du corps
          ),
        ),
      ),
    );
  }
}