import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ProductsShimmerWidget extends StatelessWidget {
  const ProductsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return  Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.grey,
              width: 120,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 60,
                    height: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15
        ),
      ),
    );
  }
}
