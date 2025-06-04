import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_city/screens/report_page.dart'; // Assurez-vous que ce chemin est correct

import 'my_report_page.dart';
// import 'map_page.dart'; // Décommentez si vous avez un fichier séparé pour MapPage

// Simulation de MapPage si elle n'est pas dans un fichier séparé pour l'exemple
class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carte interactive', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFC0262D),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(child: Text('Carte des signalements')),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir vos couleurs
    const Color couleurRougePrincipal = Color(0xFFC0262D); // Votre rouge bordeaux
    const Color couleurTexteSurFondRouge = Colors.white;
    const Color couleurFondPage = Color(0xFFF5F5F5);
    const Color couleurTexteGrisFonce = Color(0xFF424242); // Un gris foncé pour les textes principaux
    const Color couleurTexteGrisClair = Color(0xFF757575); // Un gris plus clair pour les sous-textes
    const Color couleurAccentBouton = Color(0xFFD32F2F); // Couleur pour les éléments d'accentuation (boutons accès rapide)


    final dateFormat = DateFormat('EEEE, d MMMM y', 'fr_FR');
    final today = dateFormat.format(DateTime.now());
    final String currentUsername = "Lionel"; // Assurez-vous d'obtenir le vrai nom d'utilisateur

    return Scaffold(
      backgroundColor: couleurFondPage,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Tableau de bord', // Titre simplifié
          style: TextStyle(
            fontSize: 20, // Taille de police légèrement augmentée
            color: couleurTexteSurFondRouge,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0, // ou 1 pour une ombre très subtile
        backgroundColor: couleurRougePrincipal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            _buildUserHeader(
              date: today,
              username: currentUsername,
              textColor: couleurTexteGrisFonce,
              dateColor: couleurTexteGrisClair,
            ),
            _buildQuickAccessSection(
              context: context,
              titleColor: couleurTexteGrisFonce,
              buttonAccentColor: couleurAccentBouton,
            ),
            _buildNotificationsSection(
              titleColor: couleurTexteGrisFonce,
              dateColor: couleurTexteGrisClair,
            ),
            _buildRecentActivitySection(
              titleColor: couleurTexteGrisFonce,
            ),
            const SizedBox(height: 20), // Réduit l'espace en bas
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader({
    required String date,
    required String username,
    required Color textColor,
    required Color dateColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bonjour, $username',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              color: dateColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessSection({
    required BuildContext context,
    required Color titleColor,
    required Color buttonAccentColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Accès Rapide',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _buildQuickAccessButton(
                context: context,
                icon: Icons.report_problem,
                label: 'Signaler', // Label plus court
                page: const ReportPage(),
                buttonAccentColor: buttonAccentColor,
              ),
              const SizedBox(width: 10),
              _buildQuickAccessButton(
                context: context,
                icon: Icons.map,
                label: 'Carte', // Label plus court
                page: const MapPage(),
                buttonAccentColor: buttonAccentColor,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildQuickAccessButton(
                context: context,
                icon: Icons.list_alt,
                label: 'Mes Signalements', // Label plus court
                page: const MyReportsPage(),
                buttonAccentColor: buttonAccentColor,
              ),
              const SizedBox(width: 10),
              _buildQuickAccessButton(
                context: context,
                icon: Icons.track_changes, // Peut-être trouver une icône plus adaptée
                label: 'Suivi', // Label plus court
                page: const MyReportsPage(), // Devrait peut-être être une page de suivi spécifique
                buttonAccentColor: buttonAccentColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Widget page,
    required Color buttonAccentColor,
  }) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 24, color: buttonAccentColor),
        label: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: buttonAccentColor, fontSize: 12), // Texte plus petit
          overflow: TextOverflow.ellipsis, // Gérer le débordement de texte
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: buttonAccentColor, // Couleur d'effet au clic
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Ajuster le padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: buttonAccentColor.withOpacity(0.3)), // Bordure subtile
          ),
          elevation: 1, // Légère élévation
        ),
      ),
    );
  }

  Widget _buildNotificationsSection({
    required Color titleColor,
    required Color dateColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white, // Garder un fond blanc pour les notifications
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifications Récentes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 15),
          _buildNotificationItem(
            status: 'Signalement traité',
            time: 'Aujourd\'hui, 10:45',
            message: 'Votre signalement concernant le nid-de-poule sur la route près du stade de Yansoki a été traité.',
            color: Colors.green.shade600,
            dateColor: dateColor,
          ),
          const Divider(height: 25, thickness: 0.5),
          _buildNotificationItem(
            status: 'Mise à jour',
            time: 'Hier, 14:30',
            message: 'Les travaux sur la route près du stade de Yansoki commenceront le 25 mai.',
            color: Colors.blue.shade600,
            dateColor: dateColor,
          ),
          const Divider(height: 25, thickness: 0.5),
          _buildNotificationItem(
            status: 'En Attente',
            time: '22 mai, 09:15',
            message: 'Votre signalement concernant l\'éclairage défectueux est en cours d\'évaluation.',
            color: Colors.orange.shade600,
            dateColor: dateColor,
          ),
          // Plus besoin de divider après le dernier item si c'est la fin de la section
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String status,
    required String time,
    required String message,
    required Color color,
    required Color dateColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4), // Aligner le point avec le texte
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: dateColor,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                message,
                style: TextStyle(
                  color: Colors.grey[800], // Un gris un peu plus foncé pour le message
                  fontSize: 14,
                  height: 1.4, // Interligne
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivitySection({required Color titleColor}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column( // Changé en Column pour ajouter du contenu plus tard
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activité Récente',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 10),
          // TODO: Ajouter ici le contenu de l'activité récente
          Text(
            'Aucune activité récente à afficher pour le moment.',
            style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}

// ... (Simulations des autres pages si nécessaire)
// class ReportPage extends StatelessWidget { ... }
// class MyReportsPage extends StatelessWidget { ... }