import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'report_page.dart';
import 'my_report_page.dart';


class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MapPage(),
    const ReportPage(),
    const MyReportsPage(),
    ProfilePage(avatarUrl: '',
      createdAt: DateTime(2024, 1, 1), email: '', username: '',),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.mapPin), label: 'Carte'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.plusCircle), label: 'Signaler'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.clipboardList), label: 'Mes signalements'),
          BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profil'),
        ],
      ),
    );
  }
}
