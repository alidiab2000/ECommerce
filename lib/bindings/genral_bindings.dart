import 'package:e_commerce/core/utils/helpers/network_manager.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class GenralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }

}