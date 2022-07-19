import 'package:computer_sync/src/app_widget.dart';
import 'package:computer_sync/src/shared/core/locale/locale_model.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const App());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => LocaleModel()),
      ],
      child: const App(),
    ),
  );
}
