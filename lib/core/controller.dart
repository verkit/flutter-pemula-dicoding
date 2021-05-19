import 'package:dicoding/core/model.dart';
import 'package:dicoding/data.dart';
import 'package:dicoding/ui/widget/category_item.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var categoryItem = <Category>[].obs;
  var selectedCategory = ''.obs;

  var products = <Product>[].obs;
  var productShowing = <Product>[].obs;

  void selectCategory(CategoryItem item) {
    selectedCategory.value = item.toString();
    productShowing.value = products
        .where((element) => element.type == selectedCategory.value.toString().replaceAll('CategoryItem.', ''))
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    categoryItem.value = [
      Category(name: CategoryItem.food),
      Category(name: CategoryItem.accessories),
      Category(name: CategoryItem.toys)
    ];
    selectedCategory.value = CategoryItem.food.toString();
    products.value = dummyYummy.map((e) => Product.fromMap(e)).toList();
    productShowing.value = products
        .where((element) => element.type == selectedCategory.value.toString().replaceAll('CategoryItem.', ''))
        .toList();
  }
}

class ProductController extends GetxController {
  var qty = 1.obs;
  var total = 0.0.obs;
  var isFavorite = false.obs;

  void addToFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void increment(double price) {
    qty.value++;
    total.value = qty.value * price;
  }

  void decrement(double price) {
    if (qty.value > 1) {
      qty.value--;
      total.value = qty.value * price;
    }
  }
}
