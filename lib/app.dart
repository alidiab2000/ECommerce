import 'package:e_commerce/bindings/genral_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Feature/auth/views/onBorading/onborading.dart';
import 'core/utils/common/routes/app_router.dart';
import 'core/utils/theme/theme.dart';

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ECommerce App',
      initialBinding: GenralBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.root,
      getPages: AppRoute.routes,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnBoardingView(),
    );
  }
}
