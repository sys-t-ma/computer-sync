import 'package:computer_sync/src/shared/core/core_export.dart';
import 'package:computer_sync/src/shared/core/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  const ButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  }) : super(key: key);

  const ButtonWidget.primary({
    Key? key,
    required this.label,
    required this.onTap,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          width: 150,
          child: MaterialButton(
            color: isPrimary
                ? AppColors.primary
                : themeNotifier.isDark
                    ? AppColors.darkButton
                    : AppColors.lightButton,
            textColor: isPrimary
                ? AppColors.primaryText
                : themeNotifier.isDark
                    ? AppColors.darkButtonText
                    : AppColors.lightButtonText,
            onPressed: onTap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                label,
                style: AppTextStyles.buttonLabel,
              ),
            ),
          ),
        ),
      );
    });
  }
}
