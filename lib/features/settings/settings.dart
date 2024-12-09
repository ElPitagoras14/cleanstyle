import 'package:cleanstyle/core/providers/locale_model.dart';
import 'package:cleanstyle/core/providers/theme_style_model.dart';
import 'package:cleanstyle/shared/widgets/custom_bottom_navigation_bar.dart';
import 'package:cleanstyle/shared/widgets/custom_dropdown.dart';
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
        label: AppLocalizations.of(context)!.settings_theme_option_system,
      ),
      DropdownMenuEntry(
        value: ThemeMode.light,
        label: AppLocalizations.of(context)!.settings_theme_option_light,
      ),
      DropdownMenuEntry(
        value: ThemeMode.dark,
        label: AppLocalizations.of(context)!.settings_theme_option_dark,
      ),
    ];

    final List<DropdownMenuEntry<String>> languageOptions = [
      DropdownMenuEntry(
        value: "es",
        label: AppLocalizations.of(context)!.settings_language_option_spanish,
      ),
      DropdownMenuEntry(
        value: "en",
        label: AppLocalizations.of(context)!.settings_language_option_english,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings_title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomConfigOption(
                  title: AppLocalizations.of(context)!.settings_language_title,
                  description: AppLocalizations.of(context)!
                      .settings_language_description,
                  action: SizedBox(
                    width: 140.0,
                    child: CustomDropdown(
                      options: languageOptions,
                      onChanged: (value) {
                        value ??= "en";
                        localeModel.changeLocale(Locale(value));
                      },
                    ),
                  ),
                ),
                const Divider(height: 1),
                CustomConfigOption(
                  title: AppLocalizations.of(context)!.settings_clothes_tittle,
                  description: AppLocalizations.of(context)!
                      .settings_clothes_description,
                  action: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                    ),
                  ),
                ),
                const Divider(height: 1),
                CustomConfigOption(
                  title: AppLocalizations.of(context)!.settings_data_tittle,
                  description:
                      AppLocalizations.of(context)!.settings_data_description,
                  action: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right,
                    ),
                  ),
                ),
                const Divider(height: 1),
                CustomConfigOption(
                  title: AppLocalizations.of(context)!.settings_theme_title,
                  description:
                      AppLocalizations.of(context)!.settings_theme_description,
                  action: SizedBox(
                    width: 140.0,
                    child: CustomDropdown(
                      options: themeModes,
                      onChanged: (value) {
                        value ??= ThemeMode.system;
                        themeModel.setThemeData(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}

class CustomConfigOption extends StatelessWidget {
  const CustomConfigOption({
    super.key,
    required this.title,
    required this.description,
    required this.action,
  });

  final String title;
  final String description;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                description,
              ),
            ],
          ),
          action
        ],
      ),
    );
  }
}
