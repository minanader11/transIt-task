
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';
import 'package:transit_task/core/theme/colors.dart';

class ShimmerLoading extends StatelessWidget {
  ShimmerLoading({required this.height, required this.width});

  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        color: MyColors.backGroundColor,
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 100.w,
                height: 150.h,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),

            Container(height: 150.h,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(height: 15.h, width: 100.w, color: Colors.white),
                ),

                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(height: 15.h, width: 100.w,color: Colors.white,),
                ),

                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(height: 15.h, width: 100.w,color: Colors.white,),
                ),
              ],),
            ),

          ],
        ),
      ),
    );
  }
}
