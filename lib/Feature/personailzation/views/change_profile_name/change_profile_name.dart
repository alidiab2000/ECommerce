import 'package:e_commerce/Feature/personailzation/controllers/update_name/update_name_controller.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/core/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/utils/common/widgets/login_sigup/commen_widget/custom_form_field.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/validators/validation.dart';

class ChangeProfileNameView extends StatelessWidget {
  const ChangeProfileNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final updateNamecontroller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Change Profile Name"),
        showBackArrow: true,
        backArrowOnPressed: ()  => Get.offNamed(AppRoute.profileViewPath),
      ),
      body: Form(
        key: updateNamecontroller.updateNameFormKey,
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              CustomFormField(
                controller: updateNamecontroller.firstNameController,
                validator: (firstName) =>
                    Validator.validateName("First Name", firstName),
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Iconsax.user),
                labelText: AppTexts.firstName,
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),
              CustomFormField(
                controller: updateNamecontroller.lastNameController,
                validator: (lastName) =>
                    Validator.validateName("Last Name", lastName),
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Iconsax.user),
                labelText: AppTexts.lastName,
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await updateNamecontroller.updateUserName();
                    Loaders.successSnackBar(
                      title: "Success",
                      message: "Profile Name Updated Successfully",
                    );
                  },
                  child: const Text("Save Changes"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
