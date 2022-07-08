import 'package:computer_sync/src/shared/core/core_export.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(AppAssets.logo),
              const SizedBox(height: 5),
              const Text('Computer Sync', style: TextStyle(fontSize: 18)),
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
