import 'package:computer_sync/src/modules/home/home_page.dart';
import 'package:computer_sync/src/shared/core/app_colors.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(builder: (context, ThemeModel themeNotifier, child) {
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
          home: const HomePage(title: 'Computer Sync'),
        );
      }),
    );
  }
}
