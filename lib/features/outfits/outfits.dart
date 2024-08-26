import 'package:cleanstyle/features/closet/closet.dart';
import 'package:cleanstyle/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OutfitsScreen extends StatelessWidget {
  const OutfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.checkroom),
              label: AppLocalizations.of(context)!.navigation_closet,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.auto_awesome),
              label: AppLocalizations.of(context)!.navigation_outfit,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.navigation_settings,
            ),
          ],
          currentIndex: 1,
          selectedItemColor: Colors.indigo,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ClosetScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = 0.0;
                      const end = 1.0;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var opacityAnimation = animation.drive(tween);
                      return FadeTransition(
                          opacity: opacityAnimation, child: child);
                    },
                  ),
                  (route) => false,
                );
                break;
              case 1:
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const OutfitsScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = 0.0;
                      const end = 1.0;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var opacityAnimation = animation.drive(tween);
                      return FadeTransition(
                          opacity: opacityAnimation, child: child);
                    },
                  ),
                  (route) => false,
                );
                break;
              case 2:
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const SettingsScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = 0.0;
                      const end = 1.0;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var opacityAnimation = animation.drive(tween);
                      return FadeTransition(
                          opacity: opacityAnimation, child: child);
                    },
                  ),
                  (route) => false,
                );
                break;
            }
          }),
    );
  }
}
