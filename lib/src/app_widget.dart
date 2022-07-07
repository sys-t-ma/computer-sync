import 'package:computer_sync/src/modules/home/home_page.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Computer Sync',
//       theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
//       home: const HomePage(title: 'Computer Sync'),
//     );
//   }
// }

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
                  primaryColorDark: Colors.purple,
                )
              : ThemeData.light().copyWith(
                  useMaterial3: true,
                  colorScheme: ColorScheme(
                    brightness: Brightness.dark,
                    primary: Colors.green,
                    onPrimary: Colors.purpleAccent,
                    secondary: Colors.amber,
                    onSecondary: Colors.brown,
                    error: Colors.red,
                    onError: Colors.red,
                    background: Colors.grey,
                    onBackground: Colors.black,
                    surface: Colors.amberAccent,
                    onSurface: Colors.cyanAccent,
                  ),
                ),
          home: const HomePage(title: 'Computer Sync'),
        );
      }),
    );
  }
}
