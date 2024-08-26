import 'package:cleanstyle/core/global_theme.dart';
import 'package:cleanstyle/core/providers/locale_model.dart';
import 'package:cleanstyle/core/providers/theme_style_model.dart';
import 'package:cleanstyle/features/closet/closet.dart';
import 'package:cleanstyle/features/outfits/outfits.dart';
import 'package:cleanstyle/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleModel()),
        ChangeNotifierProvider(create: (_) => ThemeStyleModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocaleModel, ThemeStyleModel>(
        builder: (context, localeModel, themeModel, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        locale: Provider.of<LocaleModel>(context).locale,
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: GlobalTheme.lightThemeData,
        darkTheme: GlobalTheme.darkThemeData,
        themeMode: themeModel.themeMode,
        initialRoute: "/closet",
        routes: {
          "/": (context) => const ClosetScreen(),
          "/closet": (context) => const ClosetScreen(),
          "/outfits": (context) => const OutfitsScreen(),
          "/settings": (context) => const SettingsScreen(),
        },
      );
    });
  }
}
