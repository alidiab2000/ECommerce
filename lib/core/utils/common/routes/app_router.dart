import 'package:e_commerce/Feature/personailzation/views/address/add_new_address_view.dart';
import 'package:e_commerce/Feature/personailzation/views/setttings/load_data.dart';
import 'package:e_commerce/Feature/shop/views/cart/cart_view.dart';
import 'package:e_commerce/Feature/shop/views/checkout/checkout_view.dart';
import 'package:e_commerce/Feature/shop/views/order/order.dart';
import 'package:e_commerce/Feature/shop/views/product_reviews/product_reviews_view.dart';
import 'package:e_commerce/Feature/shop/views/sub_catergory/sub_caterogries_view.dart';
import '../../../../Feature/auth/views/re_auth/re_auth_login_form.dart';
import '../../../../Feature/personailzation/views/address/address_view.dart';
import '../../../../Feature/personailzation/views/change_profile_name/change_profile_name.dart';
import '../../../../Feature/personailzation/views/profile/profile.dart';
import '../../../../Feature/personailzation/views/setttings/settings_view.dart';
import '../../../../Feature/shop/views/all_brands/all_brands.dart';
import '../../../../Feature/shop/views/all_products/all_products_view.dart';
import '../../../../Feature/shop/views/wishlist/wishlist_view.dart';
import '../../../../Feature/shop/views/product_details/product_detail_view.dart';
import '../../../../Feature/shop/views/store/store_view.dart';
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
  static const onBoardingView = '/OnBoardingViewPath';
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
  static const profileViewPath = '/ProfileView';
  static const productDetailViewPath = '/ProductDetailView';
  static const productReviewsViewPath = '/ProductReviewsView';
  static const addressViewPath = '/AddressView';
  static const addNewAddressViewPath = '/AddNewAddressView';
  static const cartviewPath = '/CartView';
  static const chekoutViewPath = '/CheckoutView';
  static const orderViewPath = '/OrderView';
  static const subCatergoriesViewPath = '/SubCatergoriesView';
  static const allProductsViewPath = '/AllProductsView';
  static const allBrnadsViewPath = '/AllBrandsView';
  static const changeProfileNameViewPath = '/ChangeProfileNameView';
  static const reAuthLoginFormViewPath = '/ReAuthLoginFormView';
  static const loaddataPath = '/LoadDataPath';

  //[RouteList]
  static final routes = [
    GetPage(
      name: AppRoute.onBoardingView,
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
    GetPage(
      name: AppRoute.productReviewsViewPath,
      page: () => const ProductReviewsView(),
    ),
    GetPage(
      name: AppRoute.addressViewPath,
      page: () => const AddressView(),
    ),
    GetPage(
      name: AppRoute.addNewAddressViewPath,
      page: () => const AddNewAddress(),
    ),
    GetPage(
      name: AppRoute.cartviewPath,
      page: () => const CartView(),
    ),
    GetPage(
      name: AppRoute.chekoutViewPath,
      page: () => const CheckoutView(),
    ),
    GetPage(
      name: AppRoute.orderViewPath,
      page: () => const OrderView(),
    ),
    GetPage(
      name: AppRoute.subCatergoriesViewPath,
      page: () => const SubCatergriesView(),
    ),
    GetPage(
      name: AppRoute.allProductsViewPath,
      page: () => const AllProductsView(),
    ),
    GetPage(
      name: AppRoute.allBrnadsViewPath,
      page: () => const AllBrandsView(),
    ),
    GetPage(
      name: AppRoute.changeProfileNameViewPath,
      page: () => const ChangeProfileNameView(),
    ),
    GetPage(
      name: AppRoute.reAuthLoginFormViewPath,
      page: () => const ReAuthLoginForm(),
    ),
    GetPage(
      name: AppRoute.loaddataPath,
      page: () => const LoadDataView(),
    ),
  ];
}
