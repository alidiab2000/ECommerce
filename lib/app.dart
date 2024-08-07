import 'package:e_commerce/bindings/genral_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Feature/shop/views/navigationBarMenu/navigation_menu.dart';
import 'core/utils/common/routes/app_router.dart';
import 'core/utils/theme/theme.dart';

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: 'ECommerce App',
        initialBinding: GenralBindings(),
        debugShowCheckedModeBanner: false,
        getPages: AppRoute.routes,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const NavigationMenu(),
      ),
    );
  }
}
