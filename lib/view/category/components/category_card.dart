import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/model/category.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: InkWell(
        onTap: (){
          setState(() {
            _selected = !_selected;
          });
        },
        child: CachedNetworkImage(
          imageUrl: baseUrl + widget.category.image,
          imageBuilder: (context, imageProvider) => Material(
            elevation: 8,
            shadowColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              height: _selected ? 200 : 140,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: const Alignment(-1, 0),
                      child: Text(
                        widget.category.name,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        dashboardController.updateIndex(1);
                        productController.searchTextEditController.text = 'cat: ${widget.category.name}';
                        productController.searchVal.value = 'cat: ${widget.category.name}';
                        productController.getProductByCategory(id: widget.category.id);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: const BorderRadius.all(Radius.circular(24))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8
                          ),
                          child: Text(
                            'View more',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          placeholder: (context, url) => Material(
            elevation: 8,
            shadowColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
            child: Shimmer.fromColors(
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          color: Colors.grey,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: const BorderRadius.all(Radius.circular(24))
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8
                            ),
                            child: Text(
                              'View more',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white),
          ),
          errorWidget: (context, url, error) => Material(
            elevation: 8,
            shadowColor: Colors.grey.shade300,
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)
              ),
              child: const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
