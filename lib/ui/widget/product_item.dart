import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding/core/model.dart';
import 'package:dicoding/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;

  const ProductItemWidget({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(MyRouter.detail, arguments: product);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(offset: Offset(-1, 0.5), color: Colors.black.withOpacity(0.08), blurRadius: 16),
                    ],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            height: Get.width * 0.25,
                            child: CachedNetworkImage(
                              imageUrl: product.image!,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                              errorWidget: (context, url, error) => Center(child: Text(error)),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        product.name!.capitalize!,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$${product.price!.toString()}',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.lightGreen[400], boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Colors.lightGreen,
                  blurRadius: 4,
                )
              ]),
              child: Icon(
                FlutterRemix.add_line,
                color: Colors.white,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
