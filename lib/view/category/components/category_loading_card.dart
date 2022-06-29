import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoadingCard extends StatelessWidget {
  const CategoryLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Material(
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
    );
  }
}
