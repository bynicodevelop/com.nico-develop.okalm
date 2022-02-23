import 'package:com_nico_develop_relax/screens/main_screen.dart';
import 'package:com_nico_develop_relax/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final double height;
  const HomeScreen({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          MainScreen(
            height: widget.height,
          ),
          const SettingsScreen(),
        ],
      ),
    );
  }
}
