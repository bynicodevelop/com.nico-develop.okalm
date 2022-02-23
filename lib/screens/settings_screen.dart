import 'package:com_nico_develop_relax/screens/settings/parameters_screen.dart';
import 'package:com_nico_develop_relax/screens/settings/who_it_works_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HowItWorkScreen(),
              ),
            ),
            title: const Text('Comment ça marche ?'),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ParametersScreen(),
              ),
            ),
            title: const Text('Paramétrez votre séances'),
          ),
        ],
      ),
    );
  }
}
