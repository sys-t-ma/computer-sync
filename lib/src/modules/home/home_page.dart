import 'package:computer_sync/src/shared/widgets/locale_row/locale_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:computer_sync/src/shared/core/core_export.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';

import 'package:computer_sync/src/shared/widgets/button/button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              const LocaleRowWidget(),
              const SizedBox(height: 30),
              Image.asset(
                themeNotifier.isDark ? AppAssets.logoDark : AppAssets.logoLight,
                width: 96,
              ),
              const SizedBox(height: 30),
              const Text(
                'Computer Sync',
                style: AppTextStyles.titleBold,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget.primary(
                    label: AppLocalizations.of(context)!.export,
                    onTap: () {},
                  ),
                  ButtonWidget(
                    label: AppLocalizations.of(context)!.import,
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            themeNotifier.isDark
                ? themeNotifier.isDark = false
                : themeNotifier.isDark = true;
          },
          child: Icon(
            themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny,
          ),
        ),
      );
    });
  }
}
