import 'package:computer_sync/src/modules/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computer Sync',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(title: 'Computer Sync'),
    );
  }
}
