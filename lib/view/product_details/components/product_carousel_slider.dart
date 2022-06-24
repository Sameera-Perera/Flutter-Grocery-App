import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:shimmer/shimmer.dart';

class ProductCarouselSlider extends StatefulWidget {
  final List<String> images;
  const ProductCarouselSlider({Key? key, required this.images})
      : super(key: key);

  @override
  State<ProductCarouselSlider> createState() => _ProductCarouselSliderState();
}

class _ProductCarouselSliderState extends State<ProductCarouselSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: widget.images
                  .map((e) => Container(
                        color: Colors.white,
                        child: Hero(
                          tag: e,
                          child: CachedNetworkImage(
                            imageUrl: baseUrl + e,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(image: imageProvider)),
                            ),
                            placeholder: (context, url) => Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey.shade300,
                              child: Container(
                                color: Colors.grey.shade300,
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
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 1.5,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
            Positioned(
                child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.map((e) {
            int index = widget.images.indexOf(e);
            return Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.grey.shade600
                      : Colors.grey.shade400),
            );
          }).toList(),
        )
      ],
    );
  }
}
