import 'package:dicoding/ui/pages/detail.dart';
import 'package:dicoding/ui/pages/home.dart';
import 'package:get/get.dart';

abstract class MyRouter {
  static var home = '/';
  static var detail = '/detail';
  static var cart = '/cart';

  static var list = [
    GetPage(name: home, page: () => MyHomePage()),
    GetPage(name: detail, page: () => DetailProductPage()),
  ];
}
