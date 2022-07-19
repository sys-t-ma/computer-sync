import 'package:computer_sync/src/modules/home/home_page.dart';
import 'package:computer_sync/src/shared/core/app_colors.dart';
import 'package:computer_sync/src/shared/core/locale/locale_model.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2(builder: (
      context,
      ThemeModel themeNotifier,
      LocaleModel localeNotifier,
      child,
    ) {
      return MaterialApp(
        title: 'Computer Sync',
        theme: themeNotifier.isDark
            ? ThemeData.dark().copyWith(
                useMaterial3: true,
                scaffoldBackgroundColor: AppColors.darkBackground,
              )
            : ThemeData.light().copyWith(
                useMaterial3: true,
                scaffoldBackgroundColor: AppColors.lightBackground,
              ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
          Locale('pt', 'BR'),
        ],
        locale: Locale(localeNotifier.locale),
        home: const HomePage(title: 'Computer Sync'),
      );
    });
  }
}
