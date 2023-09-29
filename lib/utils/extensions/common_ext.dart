import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/resources/dimens.dart';
import 'app_dimen.dart';

Future<void> launchUrlMy(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}

double getToolbarHeight(
  BuildContext context, {
  bool canExpand = false,
  bool expanded = false,
}) {
  if (canExpand) {
    if (Platform.isAndroid) {
      return !expanded
          ? Dimens.d188.responsive() - getPadding(context).top
          : Dimens.d252.responsive() - getPadding(context).top;
    } else {
      return !expanded ? Dimens.d200.responsive() : Dimens.d264.responsive();
    }
  } else {
    if (Platform.isAndroid) {
      return Dimens.d168.responsive() - getPadding(context).top;
    } else {
      return Dimens.d180.responsive();
    }
  }
}

MediaQueryData mediaInstance(BuildContext context) {
  return MediaQuery.of(context);
}

Size getSize(BuildContext context) => mediaInstance(context).size;

EdgeInsets getPadding(BuildContext context) => mediaInstance(context).padding;

EdgeInsets getViewInsets(BuildContext context) =>
    mediaInstance(context).viewInsets;

EdgeInsets getViewPadding(BuildContext context) =>
    mediaInstance(context).viewPadding;
