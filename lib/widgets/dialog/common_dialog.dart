import 'package:flutter/material.dart';
import '../../config/resources/dimens.dart';
import '../../config/themes/app_theme.dart';
import '../../utils/extensions/app_dimen.dart';

import '../../utils/style_utils.dart';

class CommonAlertDialog extends StatelessWidget {
  const CommonAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.getInstance().backgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.d14.responsive()),
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimens.d20.responsive(),
                horizontal: Dimens.d16.responsive(),
              ),
              child: Column(
                children: [
                  title,
                  spaceH8,
                  content,
                ],
              ),
            ),
            Divider(
              color: AppTheme.getInstance().dividerColor,
              height: 0,
            ),
            IntrinsicHeight(
              child: SizedBox(
                height: Dimens.d43.responsive(),
                child: Row(
                  children: _buildAction,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get _buildAction => [
        for (var i = 0; i < actions.length; i++) ...[
          Expanded(
            child: Center(child: actions[i]),
          ),
          if (i < actions.length - 1)
            const VerticalDivider(
              width: 0,
            )
        ]
      ];
}
