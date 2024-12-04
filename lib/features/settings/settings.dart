import 'package:cleanstyle/core/providers/locale_model.dart';
import 'package:cleanstyle/core/providers/theme_style_model.dart';
import 'package:cleanstyle/shared/widgets/custom_bottom_navigation_bar.dart';
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
        title: Text(AppLocalizations.of(context)!.settings_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}
