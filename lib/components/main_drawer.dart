import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});


  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      onTap: onTap,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 50,
              right: 20,
              left: 20,
              bottom: 20
            ),
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.restaurant, 
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)
          ),
          _createItem(
            Icons.settings, 
            'Configurações',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS) 
          )
        ],
      ),
    );
  }
}