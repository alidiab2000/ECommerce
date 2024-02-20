import 'lgoin_header.dart';
import 'login_form.dart';
import 'loing_form_divider.dart';
import 'social_buton.dart';
import '../../../../../core/utils/common/styles/spacing_style.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: SpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              //logo - title and sub tittle
              children: [
                const LoginHeader(),
                const LoginForm(),
                const FormDivider(
                  dividerText: AppTexts.orSignInWith,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconImage: AppImages.google,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: CustomSizes.defaultSpace,
                    ),
                    SocialButton(
                      iconImage: AppImages.facebook,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
