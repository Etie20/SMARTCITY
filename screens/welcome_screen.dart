import 'package:flutter/material.dart';
import 'login_screen.dart'; // Assurez-vous que ce chemin d'importation est correct

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir votre couleur rouge spécifique pour une utilisation facile
    const Color couleurRougeSpecifique = Color(0xFFD32F2F);

    return Scaffold(
      backgroundColor: Colors.white, // Fond de l'écran reste blanc
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'LOGO', // Ou votre widget logo
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: couleurRougeSpecifique, // Utiliser la couleur spécifique
                ),
              ),
              const SizedBox(height: 24),
              CircularProgressIndicator(
                color: couleurRougeSpecifique, // Utiliser la couleur spécifique
              ),
              const SizedBox(height: 32),
              Text(
                'Signalez.\nSuivez.\nAméliorez votre ville.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: couleurRougeSpecifique, // Utiliser la couleur spécifique
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement( // Recommandé pour les écrans de bienvenue
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: couleurRougeSpecifique, // Fond du bouton avec la couleur spécifique
                  foregroundColor: Colors.white, // Texte du bouton en blanc pour contraster
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                ),
                child: const Text('Redirection vers l’écran principal...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}