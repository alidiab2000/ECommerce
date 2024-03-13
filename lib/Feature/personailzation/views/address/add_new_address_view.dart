import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../core/utils/constants/text_strings.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text("Add New Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const CustomFormField(
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Iconsax.user),
                labelText: 'Name',
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),
              const CustomFormField(
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Iconsax.mobile),
                labelText: AppTexts.phoneNo,
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),
              const Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      keyboardType: TextInputType.streetAddress,
                      prefixIcon: Icon(Iconsax.buliding),
                      labelText: 'Street',
                    ),
                  ),
                  SizedBox(width: CustomSizes.spaceBtwInputFields),
                  Expanded(
                    child: CustomFormField(
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Iconsax.code),
                      labelText: "Postal code",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),
              const Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(
                        Icons.home,
                      ),
                      labelText: 'City',
                    ),
                  ),
                  SizedBox(width: CustomSizes.spaceBtwInputFields),
                  Expanded(
                    child: CustomFormField(
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(Iconsax.activity),
                      labelText: "State",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),
              const CustomFormField(
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Iconsax.global),
                labelText: 'Country',
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
