import '../../../../Feature/personailzation/views/profile/profile.dart';
import '../../../../Feature/personailzation/views/setttings/settings_view.dart';
import '../../../../Feature/shop/views/wishlist/wishlist_view.dart';

import '../../../../Feature/shop/views/product_details/product_detail.dart';
import '../../../../Feature/shop/views/store/store_view.dart';
import '../widgets/login_sigup/commen_widget/screens/success.dart';
import '../../../../Feature/auth/views/login/login.dart';
import '../../../../Feature/auth/views/onBorading/onborading.dart';
import '../../../../Feature/auth/views/password_configration/forget_password.dart';
import '../../../../Feature/auth/views/password_configration/reset_password.dart';
import '../../../../Feature/auth/views/register/register.dart';
import '../../../../Feature/auth/views/register/verify.dart';
import '../../../../Feature/shop/views/home/home_view.dart';
import '../../../../Feature/shop/views/navigationBarMenu/navigation_menu.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  static const root = '/';
  static const loginViewPath = '/LoginView';
  static const registerViewPath = '/RegisterView';
  static const verifyViewPath = '/VerifyView';
  static const successViewPath = '/SuccessView';
  static const forgetPasswordViewPath = '/ForgetPasswordView';
  static const resetPasswordviewPath = '/ResetPasswordview';
  static const navigationMenuPath = '/NaviagationMenu';
  static const homeViewPath = '/HomeView';
  static const storeViewPath = '/StoreView';
  static const wishListViewPath = '/WishListView';
  static const settingViewPath = '/SettingView';
  static const profileViewPath = '/profileView';
  static const productDetailViewPath = '/productDetailView';

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
    GetPage(
      name: AppRoute.navigationMenuPath,
      page: () => const NavigationMenu(),
    ),
    GetPage(
      name: AppRoute.storeViewPath,
      page: () => const StoreView(),
    ),
    GetPage(
      name: AppRoute.wishListViewPath,
      page: () => const WishListView(),
    ),
    GetPage(
      name: AppRoute.settingViewPath,
      page: () => const SettingsView(),
    ),
    GetPage(
      name: AppRoute.homeViewPath,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoute.profileViewPath,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: AppRoute.productDetailViewPath,
      page: () => const ProductDetailView(),
    ),
  ];
}
