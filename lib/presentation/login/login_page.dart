import 'package:flutter/material.dart';

import '../../config/resources/dimens.dart';
import '../../config/resources/styles.dart';
import '../../config/themes/app_theme.dart';
import '../../utils/constants/image_asset.dart';
import '../../utils/extensions/app_dimen.dart';
import '../../utils/style_utils.dart';
import '../../widgets/text_field/common_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void didChangeDependencies() {
    AppDimen.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Dimens.d30.responsive()),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageAssets.images.imgLogin.image(),
                spaceH44,
                CommonTextField(
                  name: 'email',
                  hintText: 'Email',
                  onChanged: (value) {},
                ),
                spaceH16,
                CommonTextField(
                  name: 'password',
                  hintText: 'Password',
                  onChanged: (value) {},
                  sufficIcon:
                      ImageAssets.images.icEye.svg(fit: BoxFit.scaleDown),
                ),
                spaceH8,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lupa password?',
                      style: AppTextStyle.regularText.copyWith(
                        color: AppTheme.getInstance().textPrimary,
                      ),
                    ),
                  ),
                ),
                spaceH24,
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.getInstance().buttonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.d8.responsive()),
                    ),
                  ),
                  height: Dimens.d52.responsive(),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Masuk',
                      style: AppTextStyle.boldText.copyWith(
                        color: AppTheme.getInstance().textTheme,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                spaceH47,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: AppTheme.getInstance().divderColor,
                        height: Dimens.d3.responsive(),
                      ),
                    ),
                    spaceW1,
                    Text(
                      'Atau masuk menggunakan',
                      style: AppTextStyle.regularText.copyWith(
                        color: AppTheme.getInstance().textSecondary,
                        fontSize: 15,
                      ),
                    ),
                    spaceW1,
                    Expanded(
                      child: Container(
                        color: AppTheme.getInstance().divderColor,
                        height: Dimens.d3.responsive(),
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                spaceH32,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.d24.responsive(),
                    vertical: Dimens.d12.responsive(),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.d8.responsive()),
                    ),
                    border: Border.all(
                      color: AppTheme.getInstance().redColor,
                      width: Dimens.d3.responsive(),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageAssets.images.icGoogle.image(),
                      Text(
                        'Google',
                        style: AppTextStyle.boldText.copyWith(
                          color: AppTheme.getInstance().redColor,
                          fontSize: 15,
                        ),
                      ),
                      spaceW30,
                    ],
                  ),
                ),
                spaceH16,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.d24.responsive(),
                    vertical: Dimens.d12.responsive(),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.d8.responsive()),
                    ),
                    border: Border.all(
                      color: AppTheme.getInstance().buttonColor,
                      width: Dimens.d3.responsive(),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageAssets.images.icFaceBook.svg(),
                      Text(
                        'Facebook',
                        style: AppTextStyle.boldText.copyWith(
                          color: AppTheme.getInstance().buttonColor,
                          fontSize: 15,
                        ),
                      ),
                      spaceW30,
                    ],
                  ),
                ),
                spaceH32,
                RichText(
                  text: TextSpan(
                    text: 'Belum punya akun?',
                    style: AppTextStyle.regularText.copyWith(
                      color: AppTheme.getInstance().textSecondary,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: ' Mendaftar',
                        style: AppTextStyle.regularText.copyWith(
                          color: AppTheme.getInstance().buttonColor,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: ' sekranag',
                        style: AppTextStyle.regularText.copyWith(
                          color: AppTheme.getInstance().textSecondary,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
