import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../model/product.dart';

class PopularProductCard extends StatelessWidget {
  final Product product;
  const PopularProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 120,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: CachedNetworkImage(
                  imageUrl: baseUrl+product.images.first,
                  placeholder: (context, url) => Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey.shade300,
                    child: Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 25
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14
                  ),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
