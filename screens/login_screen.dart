import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';
import 'sign_up_screen.dart'; // Assure-toi d'importer ton écran d'inscription

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir votre couleur rouge spécifique pour une utilisation facile
    const Color couleurRougeSpecifique = Color(0xFFD32F2F);

    return Scaffold(
      backgroundColor: Colors.white, // Fond de l'écran reste blanc
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: SingleChildScrollView( // Ajout de SingleChildScrollView pour éviter le débordement sur petits écrans
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'LOGO', // Ou votre widget logo
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: couleurRougeSpecifique, // Utiliser la couleur spécifique
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Votre portail municipal',
                    style: TextStyle(fontSize: 16, color: Colors.grey), // Laissé en gris, à ajuster si besoin
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Connexion',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black), // Laissé en noir, à ajuster si besoin
                ),
                const SizedBox(height: 16),
                TextField( // Pensez à ajouter des Controllers pour gérer les entrées
                  decoration: InputDecoration(
                    labelText: 'Adresse e-mail',
                    border: const OutlineInputBorder(),
                    // Optionnel: Style pour la bordure et le label en focus
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: couleurRougeSpecifique, width: 2.0),
                    ),
                    labelStyle: TextStyle(
                      // color: Colors.grey, // Couleur du label quand pas en focus
                    ),
                    floatingLabelStyle: TextStyle(color: couleurRougeSpecifique), // Couleur du label quand en focus/flottant
                  ),
                ),
                const SizedBox(height: 16),
                TextField( // Pensez à ajouter des Controllers
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    border: const OutlineInputBorder(),
                    // Optionnel: Style pour la bordure et le label en focus
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: couleurRougeSpecifique, width: 2.0),
                    ),
                    labelStyle: TextStyle(
                      // color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(color: couleurRougeSpecifique),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavigationScreen(),
                      ),
                    );
                    // Ajouter logique de connexion ici
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: couleurRougeSpecifique, // Fond du bouton avec la couleur spécifique
                      foregroundColor: Colors.white, // Texte du bouton en blanc
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder( // Optionnel: pour des bords arrondis
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                  child: const Text('Se connecter'),
                ),
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Mot de passe oublié
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: couleurRougeSpecifique, // Couleur du texte du TextButton
                    ),
                    child: const Text('Mot de passe oublié ?'),
                  ),
                ),
                const Divider(height: 32),
                Center(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                        foregroundColor: couleurRougeSpecifique, // Couleur du texte et de l'icône
                        side: BorderSide(color: couleurRougeSpecifique, width: 1.5), // Bordure avec la couleur spécifique
                        shape: RoundedRectangleBorder( // Optionnel: pour des bords arrondis
                          borderRadius: BorderRadius.circular(8),
                        )
                    ),
                    child: const Text('S\'inscrire'),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'En vous connectant, vous acceptez nos ',
                      style: TextStyle(color: Colors.grey[700]), // Couleur de base du texte
                      children: [
                        TextSpan(
                            text: 'Conditions d’utilisation',
                            style: TextStyle(color: couleurRougeSpecifique, fontWeight: FontWeight.bold) // Utiliser la couleur spécifique
                        ),
                        const TextSpan(text: ' et notre '),
                        TextSpan(
                            text: 'Politique de confidentialité',
                            style: TextStyle(color: couleurRougeSpecifique, fontWeight: FontWeight.bold) // Utiliser la couleur spécifique
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}