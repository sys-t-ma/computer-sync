import 'package:computer_sync/src/shared/core/locale/locale_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleRowWidget extends StatelessWidget {
  const LocaleRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, LocaleModel localeNotifier, child) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text("Set locale to EN"),
              onPressed: () => localeNotifier.locale = 'en',
            ),
            TextButton(
              child: const Text("Set locale to PT"),
              onPressed: () => localeNotifier.locale = 'pt',
            ),
            TextButton(
              child: const Text("Set locale to ES"),
              onPressed: () => localeNotifier.locale = 'es',
            ),
          ],
        ),
      );
    });
  }
}
