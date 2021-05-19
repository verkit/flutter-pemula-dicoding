import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding/core/controller.dart';
import 'package:dicoding/core/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailProductPage extends StatefulWidget {
  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  var product = Get.arguments as Product;
  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(
      init: Get.put<ProductController>(ProductController()),
      builder: (_) => Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppBar().preferredSize.height),
                    CachedNetworkImage(
                      imageUrl: product.image!,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Center(child: Text(error)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        product.name!,
                        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(product.description!),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * 0.3,
                            height: 40,
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(48)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _.increment(product.price!);
                                  },
                                  child: Icon(
                                    FlutterRemix.add_line,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(_.qty.value.toString(), style: TextStyle(color: Colors.grey)),
                                InkWell(
                                  onTap: () {
                                    _.decrement(product.price!);
                                  },
                                  child: Icon(
                                    FlutterRemix.subtract_line,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            _.total.value != 0 ? "\$${_.total.value}" : "\$${product.price!}",
                            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 0),
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    child: Icon(
                      FlutterRemix.arrow_left_s_line,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            InkWell(
              onTap: () {
                _.addToFavorite();
              },
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 0),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: Icon(
                    _.isFavorite.value ? FlutterRemix.heart_fill : FlutterRemix.heart_line,
                    color: _.isFavorite.value ? Colors.red : Colors.black26,
                    size: 21,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 12, 12),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen[400],
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        offset: Offset(0, 0),
                        blurRadius: 9,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FlutterRemix.shopping_cart_2_line,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
