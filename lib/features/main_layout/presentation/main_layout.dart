import 'package:flutter/material.dart';
import 'package:sheta_store/features/main_layout/presentation/home/home_tap.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> taps = [HomeTap(), Container()];
  int currentTapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: taps[currentTapIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTapIndex,
        onTap: (index) {
          setState(() {
            currentTapIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms_outlined),
            label: "tllt",
          ),
        ],
      ),
    );
  }
}
