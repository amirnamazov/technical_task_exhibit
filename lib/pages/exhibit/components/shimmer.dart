import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: EdgeInsets.all(5),
        child: Shimmer(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0.3),
            ],
            stops: [0.25, 0.75],
          ),
          // direction: ShimmerDirection.ttb,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
}