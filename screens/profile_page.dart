import 'package:flutter/material.dart';
// Pour la mise en forme de la date, si vous souhaitez un format plus complexe ou localisé :
// import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email;
  final String avatarUrl; // Assurez-vous que cette URL est valide
  final DateTime createdAt;

  const ProfilePage({
    super.key,
    required this.username,
    required this.email,
    required this.avatarUrl,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    // Définir votre couleur rouge spécifique
    const Color couleurRougeSpecifique = Color(0xFFD32F2F);
    // Définir une couleur de contraste (généralement blanc pour un fond rouge)
    const Color couleurTexteSurFondRouge = Colors.white;

    // Mise en forme simple de la date
    final String formattedDate = "${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year}";
    // Ou utiliser intl pour une meilleure localisation si besoin:
    // final formattedDate = DateFormat('dd/MM/yyyy', 'fr_FR').format(createdAt);


    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Un gris clair pour le fond général du corps
      appBar: AppBar(
        title: const Text(
          'Profil utilisateur',
          style: TextStyle(color: couleurTexteSurFondRouge), // Texte de l'AppBar en blanc
        ),
        centerTitle: true,
        elevation: 0, // Ou une petite élévation si vous préférez
        backgroundColor: couleurRougeSpecifique, // Fond de l'AppBar en rouge bordeaux
        iconTheme: const IconThemeData(color: couleurTexteSurFondRouge), // Icônes de l'AppBar (comme le bouton retour) en blanc
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header avec image de profil et informations utilisateur
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Colors.white, // Fond blanc pour cette section
              width: double.infinity, // S'assurer que le container prend toute la largeur
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300], // Couleur de fond si l'image ne charge pas
                    backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                    child: avatarUrl.isEmpty ? const Icon(Icons.person, size: 50, color: Colors.grey) : null,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    username,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // Couleur foncée pour le nom d'utilisateur
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700], // Gris plus foncé pour l'email
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Section des informations supplémentaires dans une carte
            Container(
              padding: const EdgeInsets.all(20), // Un peu plus de padding uniforme
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [ // Ajout d'une ombre subtile pour un effet de carte
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoRow('Nom d\'utilisateur', username, context),
                  const Divider(height: 30, thickness: 0.5),
                  _buildInfoRow('Adresse e-mail', email, context),
                  const Divider(height: 30, thickness: 0.5),
                  _buildInfoRow('Compte créé le', formattedDate, context),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implémenter la logique de modification de profil
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Fonctionnalité "Modifier le profil" à implémenter')),
                      );
                    },
                    icon: const Icon(Icons.edit, color: couleurTexteSurFondRouge), // Icône en blanc
                    label: const Text(
                      'Modifier le profil',
                      style: TextStyle(color: couleurTexteSurFondRouge, fontWeight: FontWeight.bold), // Texte du bouton en blanc
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: couleurRougeSpecifique, // Fond du bouton en rouge bordeaux
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bords légèrement arrondis
                      ),
                      minimumSize: const Size(double.infinity, 48), // Bouton pleine largeur
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20), // Espace en bas
          ],
        ),
      ),
    );
  }

  // Modifié pour potentiellement utiliser le thème du contexte à l'avenir
  Widget _buildInfoRow(String label, String value, BuildContext context) {
    // final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label : ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black54, // Couleur du label
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87, // Couleur de la valeur
            ),
          ),
        ),
      ],
    );
  }
}