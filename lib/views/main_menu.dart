import 'package:agrivysor_ryzen/views/diagnostic_result.dart';
import 'package:flutter/material.dart';
import 'history_view.dart';
import 'home_view.dart';
import 'library_view.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentIndex = 0; // that gets the index to the final List<Widget>

  final List<Widget> _screens = [
    const HomeView(), //0
    const HistoryView(), //1
    const LibraryView(),
    const DiagnosticResult()//2
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFFF0F0F0),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'HISTORY',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.energy_savings_leaf),
                label: 'LIBRARY',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety),
                label: 'DIAGNOSTIC',
              )
            ],
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
