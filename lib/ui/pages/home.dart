import 'dart:ui';

import 'package:dicoding/core/controller.dart';
import 'package:dicoding/ui/widget/category_item.dart';
import 'package:dicoding/ui/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mop Petshop',
          style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
            child: Container(
              width: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: Offset(0, 0),
                    blurRadius: 9,
                  ),
                ],
              ),
              child: Icon(
                FlutterRemix.shopping_cart_line,
                color: Colors.black,
                size: 19,
              ),
            ),
          ),
        ],
      ),
      body: GetX<Controller>(
        init: Get.find<Controller>(),
        builder: (_) => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: 'Search food, accesoris, etc ...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: Icon(
                      FlutterRemix.search_line,
                      color: Colors.black,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  ),
                  style: TextStyle(),
                ),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemCount: _.categoryItem.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        _.selectCategory(_.categoryItem[i].name!);
                      },
                      child: CategoryItemWidget(categoryItem: _.categoryItem[i].name!),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best Seller',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text('See all'),
                      ],
                    ),
                    StaggeredGridView.countBuilder(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      itemCount: _.productShowing.length,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemBuilder: (ctx, i) {
                        return ProductItemWidget(
                          product: _.productShowing[i],
                        );
                      },
                      staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Special Bundle',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text('See all'),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      width: Get.width,
                      height: 110,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(offset: Offset(-1, 1), color: Colors.black26, blurRadius: 8),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xffe1bee7),
                                  Color(0xffd79de0),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(),
                                    Positioned(
                                      top: -20,
                                      left: 10,
                                      child: Image.asset('assets/meowmix.png', width: 130),
                                    ),
                                    Positioned(
                                      left: 100,
                                      child: Transform.rotate(
                                        angle: 0.2,
                                        child: Image.asset('assets/treat.png', width: 100),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Fluffy Bundle',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Get more cat food with cheapest price',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
