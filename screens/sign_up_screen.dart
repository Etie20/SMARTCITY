import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Définir votre couleur rouge spécifique pour une utilisation facile
    const Color couleurRougeSpecifique = Color(0xFFD32F2F);

    return Scaffold(
      backgroundColor: Colors.white, // Fond de l'écran reste blanc
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: SingleChildScrollView( // Ajout de SingleChildScrollView
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
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Créer un compte',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                TextField( // Pensez à ajouter des Controllers
                  decoration: InputDecoration(
                    labelText: 'Nom',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: couleurRougeSpecifique, width: 2.0),
                    ),
                    floatingLabelStyle: TextStyle(color: couleurRougeSpecifique),
                  ),
                ),
                const SizedBox(height: 16),
                TextField( // Pensez à ajouter des Controllers
                  decoration: InputDecoration(
                    labelText: 'Prénom',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: couleurRougeSpecifique, width: 2.0),
                    ),
                    floatingLabelStyle: TextStyle(color: couleurRougeSpecifique),
                  ),
                ),
                const SizedBox(height: 16),
                TextField( // Pensez à ajouter des Controllers
                  decoration: InputDecoration(
                    labelText: 'Adresse e-mail',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: couleurRougeSpecifique, width: 2.0),
                    ),
                    floatingLabelStyle: TextStyle(color: couleurRougeSpecifique),
                  ),
                ),
                const SizedBox(height: 16),
                TextField( // Pensez à ajouter des Controllers
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: couleurRougeSpecifique, width: 2.0),
                    ),
                    floatingLabelStyle: TextStyle(color: couleurRougeSpecifique),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Logique d'inscription
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: couleurRougeSpecifique,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                  child: const Text('S\'inscrire'),
                ),
                const SizedBox(height: 12),
                const Divider(height: 32),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Retour vers login
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: couleurRougeSpecifique,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: 'Déjà inscrit ? ',
                        style: TextStyle(color: Colors.grey[700]), // Couleur de base
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Se connecter',
                            style: TextStyle(fontWeight: FontWeight.bold, color: couleurRougeSpecifique),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'En vous inscrivant, vous acceptez nos ',
                      style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Conditions d’utilisation',
                          style: TextStyle(color: couleurRougeSpecifique, fontWeight: FontWeight.bold),
                          // Vous pouvez ajouter un recognizer pour rendre le texte cliquable
                          // recognizer: TapGestureRecognizer()..onTap = () { print('Conditions tapped'); },
                        ),
                        const TextSpan(text: ' et notre '),
                        TextSpan(
                          text: 'Politique de confidentialité',
                          style: TextStyle(color: couleurRougeSpecifique, fontWeight: FontWeight.bold),
                          // recognizer: TapGestureRecognizer()..onTap = () { print('Politique tapped'); },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}