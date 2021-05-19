import 'package:dicoding/core/controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller(), permanent: true);
  }
}
