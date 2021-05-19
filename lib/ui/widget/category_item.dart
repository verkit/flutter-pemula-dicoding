import 'package:dicoding/core/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CategoryItem {
  food,
  accessories,
  toys,
}

class CategoryItemWidget extends StatelessWidget {
  late final CategoryItem categoryItem;
  CategoryItemWidget({required this.categoryItem});

  chooseIcon() {
    switch (categoryItem) {
      case CategoryItem.food:
        return Image.asset('assets/caviar.png');
      case CategoryItem.toys:
        return Image.asset('assets/ball.png');
      case CategoryItem.accessories:
        return Image.asset('assets/scarf.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<Controller>(
      init: Get.find<Controller>(),
      builder: (_) => Container(
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _.selectedCategory.value != categoryItem.toString() ? Colors.white : Color(0xff8E62E1),
          boxShadow: [
            BoxShadow(offset: Offset(1, 1), color: Colors.black12, blurRadius: 4),
          ],
        ),
        padding: EdgeInsets.all(6),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,
              ),
              height: 36,
              child: chooseIcon(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                categoryItem.toString().replaceAll('CategoryItem.', '').capitalize!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: _.selectedCategory.value != categoryItem.toString() ? Colors.black : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
