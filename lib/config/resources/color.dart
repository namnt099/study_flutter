import 'package:flutter/material.dart';

const Color color3498DB = Color(0xff3498DB);
const Color colorC0C0C0 = Color(0xffC0C0C0);
const Color color000000 = Color(0xff000000);
const Color colorE74C3C = Color(0xffE74C3C);
const Color colorFFFFFF = Color(0xffFFFFFF);

///=========== Using to make change app theme ================================
abstract class AppColor {
  Color get buttonColor;
  Color get borderColor;
  Color get divderColor;
  Color get textPrimary;
  Color get textSecondary;
  Color get textTheme;
  Color get redColor;
  Color get backgroundColor;
  Color get dividerColor;
}

class LightApp extends AppColor {
  @override
  // TODO: implement borderColor
  Color get borderColor => colorC0C0C0;

  @override
  // TODO: implement buttonColor
  Color get buttonColor => color3498DB;

  @override
  // TODO: implement divderColor
  Color get divderColor => colorC0C0C0;

  @override
  // TODO: implement textPrimaryColor
  Color get textPrimary => color000000;

  @override
  // TODO: implement textSecondaryColor
  Color get textSecondary => colorC0C0C0;

  @override
  // TODO: implement redColor
  Color get redColor => colorE74C3C;

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => colorFFFFFF;

  @override
  // TODO: implement dividerColor
  Color get dividerColor => colorC0C0C0;
  
  @override
  // TODO: implement textTheme
  Color get textTheme => colorFFFFFF;
}

class DarkApp extends AppColor {
  @override
  // TODO: implement borderColor
  Color get borderColor => throw UnimplementedError();

  @override
  // TODO: implement buttonColor
  Color get buttonColor => throw UnimplementedError();

  @override
  // TODO: implement divderColor
  Color get divderColor => throw UnimplementedError();

  @override
  // TODO: implement textPrimaryColor
  Color get textPrimary => throw UnimplementedError();

  @override
  // TODO: implement textSecondaryColor
  Color get textSecondary => throw UnimplementedError();

  @override
  // TODO: implement redColor
  Color get redColor => throw UnimplementedError();

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => throw UnimplementedError();

  @override
  // TODO: implement dividerColor
  Color get dividerColor => throw UnimplementedError();
  
  @override
  // TODO: implement textTheme
  Color get textTheme => throw UnimplementedError();
}
