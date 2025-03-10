import 'package:flutter/material.dart';
import 'package:sheta_store/features/main_layout/presentation/home/home_tap.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> taps = [HomeTap(), Container(), Container(), Container()];
  int currentTapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: taps[currentTapIndex],

        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.red,
          unselectedIconTheme: IconThemeData(color: Colors.red),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentTapIndex,
          onTap: (index) {
            setState(() {
              currentTapIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(Svg("assets/icons/home.svg")),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(Svg("assets/icons/categories.svg")),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(Svg("assets/icons/favorite.svg")),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(Svg("assets/icons/profile.svg")),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
