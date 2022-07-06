import 'package:computer_sync/src/shared/core/core_export.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void file() async {
    var result = await Process.run('whoami', []);

    if (result.exitCode == 0) {
      String username = result.stdout;
      Uri filePath = Uri.file('/home/vscode/file.txt');

      bool exists = await File.fromUri(filePath).exists();
      if (!exists) {
        await File.fromUri(filePath).create();
      }
      String contents = await File.fromUri(filePath).readAsString();
      await File.fromUri(filePath).writeAsString('$contents\n$_counter');
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    file();
  }

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
            _incrementCounter();
          },
          child: Icon(
            themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny,
          ),
        ),
      );
    });
  }
}
