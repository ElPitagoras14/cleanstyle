import 'package:cleanstyle/core/providers/locale_model.dart';
import 'package:cleanstyle/core/providers/theme_style_model.dart';
import 'package:cleanstyle/features/closet/closet.dart';
import 'package:cleanstyle/features/outfits/outfits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeModel = context.watch<LocaleModel>();
    final themeModel = context.watch<ThemeStyleModel>();

    final List<DropdownMenuEntry<ThemeMode>> themeModes = [
      DropdownMenuEntry(
        value: ThemeMode.system,
        label: AppLocalizations.of(context)!.theme_mode_system,
      ),
      DropdownMenuEntry(
        value: ThemeMode.light,
        label: AppLocalizations.of(context)!.theme_mode_light,
      ),
      DropdownMenuEntry(
        value: ThemeMode.dark,
        label: AppLocalizations.of(context)!.theme_mode_dark,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                localeModel.changeLocale(const Locale('es'));
              },
              child: const Text('Cambiar a Español'),
            ),
            ElevatedButton(
              onPressed: () {
                localeModel.changeLocale(const Locale('en'));
              },
              child: const Text('Change to English'),
            ),
            const SizedBox(height: 20),
            DropdownButton<ThemeMode>(
              items: themeModes.map((entry) {
                return DropdownMenuItem<ThemeMode>(
                  value: entry.value,
                  child: Text(entry.label),
                );
              }).toList(),
              onChanged: (ThemeMode? newMode) {
                if (newMode != null) {
                  themeModel.setThemeData(newMode);
                }
              },
              hint: Text(AppLocalizations.of(context)!.theme_mode_system),
            ),
          ],
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
          currentIndex: 2,
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
