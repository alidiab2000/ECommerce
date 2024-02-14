import 'package:e_commerce/Feature/auth/views/commen_widget/screens/success.dart';
import 'package:e_commerce/Feature/auth/views/login/login.dart';
import 'package:e_commerce/Feature/auth/views/onBorading/onborading.dart';
import 'package:e_commerce/Feature/auth/views/password_configration/forget_password.dart';
import 'package:e_commerce/Feature/auth/views/password_configration/reset_password.dart';
import 'package:e_commerce/Feature/auth/views/register/register.dart';
import 'package:e_commerce/Feature/auth/views/register/verify.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  static const root = '/';
  static const loginViewPath = '/LoginView';
  static const registerViewPath = '/RegisterView';
  static const verifyViewPath = '/VerifyView';
  static const successViewPath = '/SuccessView';
  static const forgetPasswordViewPath = '/ForgetPasswordView';
  static const resetPasswordviewPath = '/ResetPasswordview';

  //[RouteList]
  static final routes = [
    GetPage(
      name: AppRoute.root,
      page: () => const OnBoardingView(),
    ),
    GetPage(
      name: AppRoute.loginViewPath,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoute.registerViewPath,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: AppRoute.verifyViewPath,
      page: () => const VerifyView(),
    ),
    GetPage(
      name: AppRoute.successViewPath,
      page: () => const SuccessView(),
    ),
    GetPage(
      name: AppRoute.forgetPasswordViewPath,
      page: () => const ForgetPasswordView(),
    ),
    GetPage(
      name: AppRoute.resetPasswordviewPath,
      page: () => const ResetPasswordview(),
    ),
  ];
}
