import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/common/styles/spacing_style.dart';
import '../../../../../core/utils/common/widgets/containers/social_buton.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';
import 'lgoin_header.dart';
import 'login_form.dart';
import 'loing_form_divider.dart';
 
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
   final controller = Get.put(LoginController()); 
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
                      onPressed:  controller.googleSignIn,
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
