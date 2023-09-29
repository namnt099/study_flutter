import 'package:flutter/cupertino.dart';

import '../../config/resources/styles.dart';
import '../../config/themes/app_theme.dart';
import '../../generated/l10n.dart';
import 'common_dialog.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.cancelText,
    this.confirmText,
    required this.onConfirm,
  });
  final String title;
  final String content;

  final String? cancelText;
  final String? confirmText;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyle.regularText.copyWith(),
      ),
      content: Column(
        children: [
          Text(
            content,
            textAlign: TextAlign.center,
            style: AppTextStyle.regularText.copyWith(
              fontSize: 14,
              color: AppTheme.getInstance().textSecondary,
            ),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          child: Text(
            cancelText ?? S.current.deny,
            style: AppTextStyle.lightText.copyWith(
              fontSize: 18,
              color: AppTheme.getInstance().textSecondary,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          onTap: onConfirm,
          child: Text(
            confirmText ?? S.current.accept,
            style: AppTextStyle.lightText.copyWith(
              fontSize: 18,
              color: AppTheme.getInstance().redColor,
            ),
          ),
        ),
      ],
    );
  }
}
