import 'package:e_commerce/Feature/shop/views/cart/widgets/car_items_list.dart';
import 'package:e_commerce/Feature/shop/views/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/common/widgets/containers/round_container.dart';
import 'package:e_commerce/core/utils/common/widgets/login_sigup/commen_widget/screens/success.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';

import '../../../../core/utils/common/widgets/products/cart/coupon_widget.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Orders Review"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(showAddRemoveButtons: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const CouponCode(),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              RoundedContainer(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                showBorder: true,
                backgroundColor: darkMode ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    BillingAmountSection(),
                    //Divder
                    Divider(),
                    SizedBox(height: CustomSizes.spaceBtwItems),

                    //Payment Method
                    BillingPaymentSection(),
                    SizedBox(height: CustomSizes.spaceBtwItems),

                    //Address
                    BillingAddressSection(),
                    SizedBox(height: CustomSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(
          child: const Text("Checkout \$250"),
          onPressed: () => Get.to(
            () => SuccessView(
              image: AppImages.successfulPaymentIcon,
              title: "Payment Successful",
              subTitle: "Your items will be shipping soon",
              onPressed: () => Get.offAllNamed(AppRoute.navigationMenuPath),
            ),
          ),
        ),
      ),
    );
  }
}
